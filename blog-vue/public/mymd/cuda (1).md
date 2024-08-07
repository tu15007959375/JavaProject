# 学习日记-cuda(1)
## nvprof工具常用参数
### **参数介绍和示例**
1. 查看活跃线程数：`nvprof --metrics achieved_occupancy ./xxx`
2. 查看内存使用带宽：`nvprof --metrics gld_throughput ./xxx`
3. 查看内存占用率：`nvprof --metrics gld_efficiency ./xxx`
4. 查看wrap执行指令的平均数量：`nvprof --metrics inst_per_warp ./xxx`
5. 查看吞吐量：`nvprof --metrics dram_read_throughput ./xxx`
6. 查看阻塞率：`nvprof --metrics stall_sync ./xxx`
7. 查看全局内存访存每次请求有多少事务：`nvprof  --metrics gld_transactions_per_request ./xxx`
8. 查看全局内存存储每次请求有多少事务：`nvprof  --metrics gst_transactions_per_request ./xxx`
9. 查看共享内存访存每次请求有多少事务：`nvprof  --metrics shared_load_transactions_per_request ./xxx`
10. 查看共享内存存储每次请求有多少事务：`nvprof  --metrics shared_store_transactions_per_request ./xxx`



注：本文只用做知识的分享的记录，详细内容请参考：https://face2ai.com/program-blog/#GPU%E7%BC%96%E7%A8%8B%EF%BC%88CUDA%EF%BC%89