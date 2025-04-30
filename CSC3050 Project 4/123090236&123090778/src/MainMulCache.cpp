
#include <cstdint>
#include <cstdlib>
#include <fstream>
#include <iostream>
#include <string>
#include <vector>

#include "Cache.h"
#include "Debug.h"
#include "MemoryManager.h"
#include "MultiLevelCacheConfig.h"

bool parseParameters(int argc, char **argv, bool& enablePrefetch, bool& enableFIFO, bool& enableVictimCache);
void printUsage();

const char *traceFilePath;

class CacheHierarchy {
private:
    MemoryManager* memory;
    Cache* l1cache;
    Cache* l2cache;
    Cache* l3cache;
    Cache* victimCache;

public:
    CacheHierarchy(bool enablePrefetch, bool enableFIFO, bool enableVictimCache) {
        memory = new MemoryManager();
        
        auto l1policy = MultiLevelCacheConfig::getL1Policy();
        auto l2policy = MultiLevelCacheConfig::getL2Policy();
        auto l3policy = MultiLevelCacheConfig::getL3Policy();
        
        l3cache = new Cache(memory, l3policy, nullptr,nullptr);
        l2cache = new Cache(memory, l2policy, l3cache,nullptr);
        if(enableFIFO){
            l1policy.associativity = l1policy.blockNum;
            l1policy.replacementPolicy = Cache::Policy::ReplacementPolicy::FIFO;
        }
        if (enableVictimCache) {
            Cache::Policy victimPolicy;
            victimPolicy.cacheSize = 8 * 1024;  // 8KB Victim Cache
            victimPolicy.blockSize = 64;
            victimPolicy.blockNum = victimPolicy.cacheSize / victimPolicy.blockSize;
            victimPolicy.associativity = victimPolicy.blockNum;  
            victimPolicy.hitLatency = 1;
            victimPolicy.missLatency = 8;
            victimPolicy.replacementPolicy = Cache::Policy::ReplacementPolicy::LRU;
            victimCache = new Cache(memory, victimPolicy, nullptr, nullptr);
            l1cache = new Cache(memory, l1policy, l2cache, victimCache);  
        } else {
            l1cache = new Cache(memory, l1policy, l2cache, nullptr);
        }
        
        if(enablePrefetch){
            l1cache->prefetchEnabled = true;
        }
        memory->setCache(l1cache);
    }
    
    ~CacheHierarchy() {
        delete l1cache;
        delete l2cache;
        delete l3cache;
        if (victimCache) delete victimCache;
        delete memory;
    }
    
    void processMemoryAccess(char op, uint32_t addr) {
        if (!memory->isPageExist(addr)) {
            memory->addPage(addr);
        }
        
        switch (op) {
            case 'r':
                l1cache->read(addr);
                break;
            case 'w':
                l1cache->write(addr, 0);
                break;
            default:
                throw std::runtime_error("Illegal memory access operation");
        }
    }

    void printResults() const {
        printf("\n=== Cache Hierarchy Statistics ===\n");
        l1cache->printStatistics();
        printf("\n=== L2 Cache Statistics ===\n");
        l2cache->printStatistics();
        printf("\n=== L3 Cache Statistics ===\n");
        l3cache->printStatistics();
    }

    void outputResults() const {

        printResults();
        
        std::string csvPath = std::string(traceFilePath) + "_multi_level.csv";
        std::ofstream csvFile(csvPath);
        
        csvFile << "Level,NumReads,NumWrites,NumHits,NumMisses,MissRate,TotalCycles\n";

        // Just write L1 statistic into the table
        outputCacheStats(csvFile, "L1", l1cache);
        outputCacheStats(csvFile, "L2", l2cache);
        outputCacheStats(csvFile, "L3", l3cache);

        csvFile.close();
        printf("\nResults have been written to %s\n", csvPath.c_str());
    }
private:
    void outputCacheStats(std::ofstream& csvFile, const char* level, const Cache* cache) const {
        auto& stats = cache->statistics;
        float missRate = static_cast<float>(stats.numMiss) / 
                        (stats.numHit + stats.numMiss) * 100;
        
        csvFile << level << ","
                << stats.numRead << ","
                << stats.numWrite << ","
                << stats.numHit << ","
                << stats.numMiss << ","
                << missRate << ","
                << stats.totalCycles << "\n";
    }
};

int main(int argc, char **argv) {
    bool enablePrefetch = false;
    bool enableFIFO = false;
    bool enableVictimCache = false;
    if (!parseParameters(argc, argv, enablePrefetch, enableFIFO, enableVictimCache)) {
        printUsage();
        return -1;
    }

    std::ifstream trace(traceFilePath);
    if (!trace.is_open()) {
        printf("Unable to open file %s\n", traceFilePath);
        return -1;
    }

    try {
        CacheHierarchy cacheHierarchy(enablePrefetch,enableFIFO,enableVictimCache);
        char op;
        uint32_t addr;
        
        while (trace >> op >> std::hex >> addr) {
            // std::cout << "Op: " << op << ", Addr: " << std::hex << addr << std::endl;
            cacheHierarchy.processMemoryAccess(op, addr);
            
        }
        
        cacheHierarchy.outputResults();
    } 
    catch (const std::exception& e) {
        std::cerr << "Error: " << e.what() << std::endl;
        return -1;
    }

    return 0;
}

bool parseParameters(int argc, char **argv, bool& enablePrefetch, bool& enableFIFO, bool& enableVictimCache) {
    // Read Parameters
    if(argc < 2)return false;

    traceFilePath = "";
    enableFIFO = false;
    enablePrefetch = false;
    enableVictimCache = false;

    for (int i = 1; i < argc - 1; ++i) {
        std::string arg = argv[i];
        if (arg == "-p") {
            enablePrefetch = true;
        }else if (arg == "-f") {
            enableFIFO = true;
        }else if (arg == "-v") {
            enableVictimCache = true;
        }else {
            std::cerr << "Unknown option: " << arg << std::endl;
            return false;
        }
    }
    traceFilePath = argv[argc - 1];
    return true;
}

void printUsage() { printf("Usage: CacheSim trace-file\n"); }