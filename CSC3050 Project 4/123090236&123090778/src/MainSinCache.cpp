#include <cstdint>
#include <cstdlib>
#include <fstream>
#include <iostream>
#include <string>
#include <vector>

#include "Cache.h"
#include "Debug.h"
#include "MemoryManager.h"

bool parseParameters(int argc, char **argv);
void printUsage();
void simulateCache(std::ofstream &csvFile, uint32_t cacheSize,
                   uint32_t blockSize, uint32_t associativity, bool useSplit);

bool verbose = false;
bool isSingleStep = false;
const char *traceFilePath;

class ICache : public Cache {
  public:
      ICache(MemoryManager* mem, const Policy &policy, Cache *lower = nullptr)
          : Cache(mem, policy, lower) {
      }
      void setByte(uint32_t addr, uint8_t val, uint32_t *cycles = nullptr){
        fprintf(stderr, "[ICache WARNING] Ignored setByte at  0x%x\n", addr);
      }
  };

int main(int argc, char **argv) {
  if (!parseParameters(argc, argv)) {
    return -1;
  }

  // Open CSV file and write header
  std::ofstream csvFile(std::string(traceFilePath) + ".csv");
  csvFile << "cacheSize,blockSize,associativity,missRate,totalCycles\n";

  // for (uint32_t cacheSize = 4 * 1024; cacheSize <= 1024 * 1024;
  //      cacheSize *= 4) {
  //   for (uint32_t blockSize = 32; blockSize <= 256; blockSize *= 2) {
  //     for (uint32_t associativity = 2; associativity <= 32;
  //          associativity *= 2) {
  //       uint32_t blockNum = cacheSize / blockSize;
  //       if (blockNum % associativity != 0)
  //         continue;

  //       simulateCache(csvFile, cacheSize, blockSize, associativity);
  //     }
  //   }
  // }
  simulateCache(csvFile, 8192, 64, 1, true);
  simulateCache(csvFile, 16384, 64, 1, false);

  printf("Result has been written to %s\n",
         (std::string(traceFilePath) + ".csv").c_str());
  csvFile.close();
  return 0;
}

bool parseParameters(int argc, char **argv) {
  // Read Parameters
  for (int i = 1; i < argc; ++i) {
    if (argv[i][0] == '-') {
      switch (argv[i][1]) {
      case 'v':
        verbose = 1;
        break;
      case 's':
        isSingleStep = 1;
        break;
      default:
        return false;
      }
    } else {
      if (traceFilePath == nullptr) {
        traceFilePath = argv[i];
      } else {
        return false;
      }
    }
  }
  if (traceFilePath == nullptr) {
    return false;
  }
  return true;
}

void printUsage() {
  printf("Usage: CacheSim trace-file [-s] [-v]\n");
  printf("Parameters: -s single step, -v verbose output\n");
}

Cache::Policy createSingleLevelPolicy(uint32_t cacheSize,
                                     uint32_t blockSize,
                                     uint32_t associativity) {
    Cache::Policy policy;
    policy.cacheSize = cacheSize;
    policy.blockSize = blockSize;
    policy.blockNum = cacheSize / blockSize;
    policy.associativity = associativity;
    policy.hitLatency = 1;
    policy.missLatency = 100;
    return policy;
}

void simulateCache(std::ofstream &csvFile, uint32_t cacheSize,
                   uint32_t blockSize, uint32_t associativity, bool useSplit) {
    auto policy = createSingleLevelPolicy(cacheSize, blockSize, associativity);
    if (useSplit){
    MemoryManager *memory = nullptr;

    ICache *icache = nullptr;
    Cache *dcache = nullptr;

    memory = new MemoryManager();
    icache = new ICache(memory, policy, nullptr);
    dcache = new Cache(memory, policy, nullptr);
    
    memory->setCache(dcache);
    // icache->printInfo(false);
    // dcache->printInfo(false);

    // Read and execute trace in cache-trace/ folder
    std::ifstream trace(traceFilePath);
    if (!trace.is_open()) {
      printf("Unable to open file %s\n", traceFilePath);
      exit(-1);
    }

    char op, type; //'r' for read, 'w' for write
    uint32_t addr;
    while (trace >> op >> std::hex >> addr >> type) {
      if (verbose){
        printf("%c %x\n", op, addr);
      }
      if (!memory->isPageExist(addr)){
        memory->addPage(addr);
      }
      
      if (type == 'I'){
        if (op == 'r'){
          icache->getByte(addr);
        } else {
          fprintf(stderr, "Icache Error!\n");
        }
      }
      else if (type == 'D'){
        if (op == 'r'){
          dcache->getByte(addr);
        } else if (op == 'w'){
          dcache->setByte(addr, 0);
        } else {
          fprintf(stderr, "Dcache Error!\n");
        }
      } else {
        fprintf(stderr, "Type Error!\n");
      }
      
      if (verbose){
        printf("Icache stat:\n");
        icache->printInfo(true);
        printf("Dcache stat:\n");
        dcache->printInfo(true);
      }
      if (isSingleStep) {
        printf("Press Enter to Continue...");
        getchar();
      }
    }

    int totalMiss = icache->statistics.numMiss + dcache->statistics.numMiss;
    int totalAccess = icache->statistics.numHit + icache->statistics.numMiss +
                  dcache->statistics.numHit + dcache->statistics.numMiss;
    int totalCycles = std::max(icache->statistics.totalCycles, 
                  dcache->statistics.totalCycles);
    float missRate = static_cast<float>(totalMiss) / totalAccess;

    // cache->printStatistics();
    // float missRate = (float)cache->statistics.numMiss /
    //                  (cache->statistics.numHit + cache->statistics.numMiss);
    printf("==== Split Cache Simulation Summary ====\n");
    printf("[ICache]\n");
    icache->printStatistics();
    printf("[DCache]\n");
    dcache->printStatistics();

    csvFile << cacheSize << "," << blockSize << "," << associativity << ","
    << missRate << "," << totalCycles << std::endl;

    delete icache;
    delete dcache;
    delete memory;
    }


    else{
    MemoryManager *memory = nullptr;
    Cache *cache = nullptr;

    memory = new MemoryManager();
    cache = new Cache(memory, policy, nullptr);
    
    memory->setCache(cache);
    // cache->printInfo(false);

    // Read and execute trace in cache-trace/ folder
    std::ifstream trace(traceFilePath);
    if (!trace.is_open()) {
      printf("Unable to open file %s\n", traceFilePath);
      exit(-1);
    }

    char op, type; //'r' for read, 'w' for write
    uint32_t addr;
    while (trace >> op >> std::hex >> addr >> type) {
      if (verbose){
        printf("%c %x\n", op, addr);
      }
      if (!memory->isPageExist(addr)){
        memory->addPage(addr);
      }
      switch (op) {
      case 'r':
        cache->getByte(addr);
        break;
      case 'w':
        cache->setByte(addr, 0);
        break;
      default:
        dbgprintf("Illegal op %c\n", op);
        exit(-1);
      }

      if (verbose){
        printf("Cache stat:\n");
        cache->printInfo(true);
      }
      if (isSingleStep) {
        printf("Press Enter to Continue...");
        getchar();
      }
    }

    int totalMiss = cache->statistics.numMiss;
    int totalCycles = cache->statistics.totalCycles;
    float missRate = (float)cache->statistics.numMiss /
                     (cache->statistics.numHit + cache->statistics.numMiss);
    printf("==== Unified Cache Simulation Summary ====\n");
    printf("[Unified Cache]\n");
    cache->printStatistics();

    csvFile << cacheSize << "," << blockSize << "," << associativity << ","
    << missRate << "," << totalCycles << std::endl;

    delete cache;
    delete memory;
  }
}