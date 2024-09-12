/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 80034
 Source Host           : localhost:3306
 Source Schema         : blog

 Target Server Type    : MySQL
 Target Server Version : 80034
 File Encoding         : 65001

 Date: 12/09/2024 15:35:01
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `intro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `createTime` datetime NULL DEFAULT NULL,
  `updateTime` datetime NULL DEFAULT NULL,
  `categoryId` int NULL DEFAULT NULL,
  `categoryName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `pageView` bigint NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 216 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES (1, '2022-11-10总结', '', '2022-11-10 20:00:30', '2022-11-10 20:00:30', 15, '个人总结', 0);
INSERT INTO `article` VALUES (2, '2022-11-12总结', '', '2022-11-12 20:00:30', '2022-11-12 20:00:30', 15, '个人总结', 0);
INSERT INTO `article` VALUES (3, '2022-11-17总结', '', '2022-11-17 20:00:30', '2022-11-17 20:00:30', 15, '个人总结', 0);
INSERT INTO `article` VALUES (4, '2022-11-1总结', '', '2022-11-01 20:00:30', '2022-11-01 20:00:30', 15, '个人总结', 0);
INSERT INTO `article` VALUES (5, '2022-11-20总结', '', '2022-11-20 20:00:30', '2022-11-20 20:00:30', 15, '个人总结', 0);
INSERT INTO `article` VALUES (6, '2022-11-23总结', '', '2022-11-23 20:00:30', '2022-11-23 20:00:30', 15, '个人总结', 0);
INSERT INTO `article` VALUES (7, '2022-11-24总结', '', '2022-11-24 20:00:30', '2022-11-24 20:00:30', 15, '个人总结', 0);
INSERT INTO `article` VALUES (8, '2022-11-28总结', '', '2022-11-28 20:00:30', '2022-11-28 20:00:30', 15, '个人总结', 0);
INSERT INTO `article` VALUES (9, '2022-11-4总结', '', '2022-11-04 20:00:30', '2022-11-04 20:00:30', 15, '个人总结', 0);
INSERT INTO `article` VALUES (10, '2022-11-7总结', '', '2022-11-07 20:00:30', '2022-11-07 20:00:30', 15, '个人总结', 0);
INSERT INTO `article` VALUES (11, '2022-12-01总结', '', '2022-12-01 20:00:30', '2022-12-01 20:00:30', 15, '个人总结', 0);
INSERT INTO `article` VALUES (12, '2022-12-04总结', '', '2022-12-04 20:00:30', '2022-12-04 20:00:30', 15, '个人总结', 0);
INSERT INTO `article` VALUES (13, '2022-12-07总结', '', '2022-12-07 20:00:30', '2022-12-07 20:00:30', 15, '个人总结', 0);
INSERT INTO `article` VALUES (14, '2022-12-09总结', '', '2022-12-09 20:00:30', '2022-12-09 20:00:30', 15, '个人总结', 0);
INSERT INTO `article` VALUES (15, '2023-1-10总结', '学习方面,心情方面', '2023-01-10 21:55:28', '2023-01-10 21:55:28', 15, '个人总结', 0);
INSERT INTO `article` VALUES (16, '2023-1-14总结', '学习方面,心情方面', '2023-01-14 15:35:55', '2023-01-14 15:35:55', 15, '个人总结', 0);
INSERT INTO `article` VALUES (17, '2023-1-16总结', '学习方面,生活方面', '2023-01-16 15:13:15', '2023-01-16 15:13:15', 15, '个人总结', 0);
INSERT INTO `article` VALUES (18, '2023-1-18总结', '学习方面,生活方面', '2023-01-18 20:20:30', '2023-01-18 20:20:30', 15, '个人总结', 0);
INSERT INTO `article` VALUES (19, '2023-1-23总结', '学习方面,生活方面', '2023-01-23 15:27:28', '2023-01-23 15:27:28', 15, '个人总结', 0);
INSERT INTO `article` VALUES (20, '2023-1-28总结', '学习方面,生活方面', '2023-01-28 15:00:50', '2023-01-28 15:00:50', 15, '个人总结', 0);
INSERT INTO `article` VALUES (21, '2023-1-31总结', '学习方面,生活方面', '2023-01-31 20:33:46', '2023-01-31 20:33:46', 15, '个人总结', 0);
INSERT INTO `article` VALUES (22, '2023-1-7总结', '', '2023-01-07 20:14:24', '2023-01-07 20:14:24', 15, '个人总结', 0);
INSERT INTO `article` VALUES (23, '2023-10-4总结', '', '2023-10-14 20:06:00', '2023-10-14 20:06:00', 15, '个人总结', 1);
INSERT INTO `article` VALUES (24, '2023-2-10总结', '学习方面,生活方面', '2023-02-10 20:33:46', '2023-02-10 20:33:46', 15, '个人总结', 0);
INSERT INTO `article` VALUES (25, '2023-2-12总结', '学习方面,生活方面', '2023-02-12 21:36:17', '2023-02-12 21:36:17', 15, '个人总结', 0);
INSERT INTO `article` VALUES (26, '2023-2-15总结', '学习方面,生活方面', '2023-02-15 14:43:39', '2023-02-15 14:43:39', 15, '个人总结', 0);
INSERT INTO `article` VALUES (27, '2023-2-18总结', '学习方面,生活方面', '2023-02-18 14:56:25', '2023-02-18 14:56:25', 15, '个人总结', 0);
INSERT INTO `article` VALUES (28, '2023-2-21总结', '学习方面,生活方面', '2023-02-21 20:13:33', '2023-02-21 20:13:33', 15, '个人总结', 0);
INSERT INTO `article` VALUES (29, '2023-2-28总结', '学习方面,生活方面', '2023-02-28 20:29:52', '2023-02-28 20:29:52', 15, '个人总结', 0);
INSERT INTO `article` VALUES (30, '2023-3-11总结', '学习方面,生活方面', '2023-03-11 15:29:03', '2023-03-11 15:29:03', 15, '个人总结', 0);
INSERT INTO `article` VALUES (31, '2023-3-16总结', '学习方面,生活方面', '2023-03-16 21:34:03', '2023-03-16 21:34:03', 15, '个人总结', 0);
INSERT INTO `article` VALUES (32, '2023-3-20总结', '学习方面,生活方面', '2023-03-20 21:49:03', '2023-03-20 21:49:03', 15, '个人总结', 0);
INSERT INTO `article` VALUES (33, '2023-3-24总结', '学习方面,生活方面', '2023-03-24 20:06:03', '2023-03-24 20:06:03', 15, '个人总结', 0);
INSERT INTO `article` VALUES (34, '2023-3-28总结', '学习方面,生活方面', '2023-03-28 20:06:03', '2023-03-28 20:06:03', 15, '个人总结', 0);
INSERT INTO `article` VALUES (35, '2023-3-2总结', '学习方面,生活方面', '2023-03-03 19:13:03', '2023-03-03 19:13:03', 15, '个人总结', 0);
INSERT INTO `article` VALUES (36, '2023-3-6总结', '学习方面,生活方面', '2023-03-06 20:07:03', '2023-03-06 20:07:03', 15, '个人总结', 0);
INSERT INTO `article` VALUES (37, '2023-4-10总结', '学习方面,生活方面', '2023-04-10 20:28:03', '2023-04-10 20:28:03', 15, '个人总结', 0);
INSERT INTO `article` VALUES (38, '2023-4-14总结', '学习方面,生活方面', '2023-04-14 20:05:03', '2023-04-14 20:05:03', 15, '个人总结', 0);
INSERT INTO `article` VALUES (39, '2023-4-18总结', '学习方面,生活方面', '2023-04-18 20:10:03', '2023-04-18 20:10:03', 15, '个人总结', 0);
INSERT INTO `article` VALUES (40, '2023-4-25总结', '学习方面,生活方面', '2023-04-25 21:04:03', '2023-04-25 21:04:03', 15, '个人总结', 0);
INSERT INTO `article` VALUES (41, '2023-4-2总结', '学习方面,生活方面', '2023-04-02 20:06:03', '2023-04-02 20:06:03', 15, '个人总结', 0);
INSERT INTO `article` VALUES (42, '2023-4-7总结', '学习方面,生活方面', '2023-04-07 20:28:03', '2023-04-07 20:28:03', 15, '个人总结', 0);
INSERT INTO `article` VALUES (43, '2023-5-10总结', '学习方面,生活方面', '2023-05-10 20:07:03', '2023-05-10 20:07:03', 15, '个人总结', 0);
INSERT INTO `article` VALUES (44, '2023-5-15总结', '学习方面,生活方面', '2023-05-15 21:28:03', '2023-05-15 21:28:03', 15, '个人总结', 0);
INSERT INTO `article` VALUES (45, '2023-5-29总结', '学习方面,生活方面', '2023-05-29 20:03:03', '2023-05-29 20:03:03', 15, '个人总结', 0);
INSERT INTO `article` VALUES (46, '2023-5-5总结', '学习方面,生活方面', '2023-05-05 21:04:03', '2023-05-05 21:04:03', 15, '个人总结', 0);
INSERT INTO `article` VALUES (47, '2023-6-21总结', '学习方面,生活方面', '2023-06-21 14:29:03', '2023-06-21 14:29:03', 15, '个人总结', 0);
INSERT INTO `article` VALUES (48, '2023-6-25总结', '学习方面,生活方面', '2023-06-25 14:47:03', '2023-06-25 14:47:03', 15, '个人总结', 0);
INSERT INTO `article` VALUES (49, '2023-6-30总结', '学习方面,生活方面', '2023-06-30 20:25:03', '2023-06-30 20:25:03', 15, '个人总结', 0);
INSERT INTO `article` VALUES (50, '2023-6-3总结', '学习方面,生活方面', '2023-06-03 21:39:03', '2023-06-03 21:39:03', 15, '个人总结', 0);
INSERT INTO `article` VALUES (51, '2023-6-7总结', '学习方面,生活方面', '2023-06-07 20:14:03', '2023-06-07 20:14:03', 15, '个人总结', 0);
INSERT INTO `article` VALUES (52, '2023-7-4总结', '学习方面,生活方面', '2023-07-04 20:25:03', '2023-07-04 20:25:03', 15, '个人总结', 0);
INSERT INTO `article` VALUES (53, '2023-9-20总结', '生活琐事', '2023-09-20 19:05:00', '2023-09-20 19:05:00', 15, '个人总结', 0);
INSERT INTO `article` VALUES (54, 'cuda (1)', 'nvprof工具常用参数', '2023-04-16 20:19:00', '2023-04-16 20:19:00', 14, 'CUDA', 0);
INSERT INTO `article` VALUES (55, 'cuda (2)', 'cuda内存模型', '2023-04-16 20:30:00', '2023-04-16 20:30:00', 14, 'CUDA', 0);
INSERT INTO `article` VALUES (56, 'cuda (3)', 'cuda内存访问模式', '2023-04-17 14:30:00', '2023-04-17 14:30:00', 14, 'CUDA', 0);
INSERT INTO `article` VALUES (57, 'cuda (4)', 'cuda共享内存', '2023-04-21 10:35:00', '2023-04-21 10:35:00', 14, 'CUDA', 0);
INSERT INTO `article` VALUES (58, 'cuda (5)', '线程束洗牌指令', '2023-05-04 11:30:00', '2023-05-04 11:30:00', 14, 'CUDA', 0);
INSERT INTO `article` VALUES (59, 'cuda (6)', 'cuda流', '2023-05-05 10:07:00', '2023-05-05 10:07:00', 14, 'CUDA', 0);
INSERT INTO `article` VALUES (60, 'gdb（1）', '', '2023-01-10 21:51:11', '2023-01-10 21:51:11', 21, 'GDB', 0);
INSERT INTO `article` VALUES (61, 'IDEA快捷键', '', '2023-10-16 21:04:00', '2023-10-16 21:04:00', 22, 'IDEA', 0);
INSERT INTO `article` VALUES (62, 'JVM(1)', 'JVM体系结构，类加载器，沙箱安全机制，Native、方法区', '2023-12-17 21:04:00', '2023-12-17 21:04:00', 8, 'JVM', 0);
INSERT INTO `article` VALUES (63, 'JVM(2)', '栈,堆（Heap）,垃圾回收（GC）', '2023-12-18 16:00:00', '2023-12-18 16:00:00', 8, 'JVM', 0);
INSERT INTO `article` VALUES (64, 'latex (1)', 'latex常用语法', '2023-06-15 15:19:00', '2023-06-15 15:19:00', 23, '论文相关', 0);
INSERT INTO `article` VALUES (65, 'latex (2)', 'latex常用语法', '2023-06-21 15:00:00', '2023-06-21 15:00:00', 23, '论文相关', 0);
INSERT INTO `article` VALUES (66, 'mc64 (1)', 'LDL分解,Multifrontal算法', '2023-03-12 14:52:01', '2023-03-12 14:52:01', 24, 'MC64', 0);
INSERT INTO `article` VALUES (67, 'mc64 (10)', '本周进度', '2023-11-16 17:00:00', '2023-11-16 17:00:00', 24, 'MC64', 0);
INSERT INTO `article` VALUES (68, 'mc64 (2)', 'Strategies for scaling and pivoting for sparse symmetric indefinite problems 浅读（1）', '2023-03-12 15:37:01', '2023-03-12 15:37:01', 24, 'MC64', 0);
INSERT INTO `article` VALUES (69, 'mc64 (3)', 'HSL MC64 文档阅读', '2023-03-17 10:05:01', '2023-03-17 10:05:01', 24, 'MC64', 0);
INSERT INTO `article` VALUES (70, 'mc64 (4)', '赋权匹配算法在对称不定线性系统求解中的应用 浅读', '2023-05-09 15:19:00', '2023-05-09 15:19:00', 24, 'MC64', 0);
INSERT INTO `article` VALUES (71, 'mc64 (5)', 'Strategies for scaling and pivoting for sparse symmetric indefinite problems 浅读', '2023-05-16 14:37:00', '2023-05-16 14:37:00', 24, 'MC64', 0);
INSERT INTO `article` VALUES (72, 'mc64 (6)', '复现算法整体流程+开会讨论相关信息', '2023-10-19 11:10:00', '2023-10-19 11:10:00', 24, 'MC64', 0);
INSERT INTO `article` VALUES (73, 'mc64 (7)', '本周进度', '2023-10-26 10:29:00', '2023-10-26 10:29:00', 24, 'MC64', 0);
INSERT INTO `article` VALUES (74, 'mc64 (8)', '本周进度', '2023-11-03 10:29:00', '2023-11-03 10:29:00', 24, 'MC64', 0);
INSERT INTO `article` VALUES (75, 'mc64 (9)', '本周进度', '2023-11-10 10:29:00', '2023-11-10 10:29:00', 24, 'MC64', 0);
INSERT INTO `article` VALUES (76, 'pac (1)', 'gprof使用教程,可视化流程,插桩分析', '2023-10-19 10:10:00', '2023-10-19 10:10:00', 26, 'PAC', 0);
INSERT INTO `article` VALUES (77, 'pac (2)', 'aos和soa,循环预处理', '2023-10-20 10:10:00', '2023-10-20 10:10:00', 26, 'PAC', 0);
INSERT INTO `article` VALUES (78, 'spmm (1)', 'A Framework for General Sparse Matrix-Matrix Multiplication on GPUs and Heterogeneous Processors 浅读 (1)', '2023-01-11 20:52:17', '2023-01-11 20:52:17', 13, 'Spmm', 0);
INSERT INTO `article` VALUES (79, 'spmm (2)', 'A Framework for General Sparse Matrix-Matrix Multiplication on GPUs and Heterogeneous Processors 浅读 (2)', '2023-01-12 14:08:31', '2023-01-12 14:08:31', 13, 'Spmm', 0);
INSERT INTO `article` VALUES (80, 'spmm (3)', 'A Framework for General Sparse Matrix-Matrix Multiplication on GPUs and Heterogeneous Processors 浅读 (3)', '2023-01-13 16:56:42', '2023-01-13 16:56:42', 13, 'Spmm', 0);
INSERT INTO `article` VALUES (81, 'spmv (1)', '存储格式', '2023-01-06 20:00:01', '2023-01-06 20:00:01', 11, '论文', 0);
INSERT INTO `article` VALUES (82, 'spmv (10)', 'CSR5：An Efficient Storage Format for Cross-Platform Sparse Matrix-Vector Multiplication 浅读 (3)', '2023-01-09 15:25:49', '2023-01-09 15:25:49', 11, '论文', 1);
INSERT INTO `article` VALUES (83, 'spmv (11)', 'NUMA-Aware Optimization of Sparse Matrix-Vector Multiplication on ARMv8-based Many-Core Architectures 浅读', '2023-01-14 14:34:18', '2023-01-14 14:34:18', 11, '论文', 0);
INSERT INTO `article` VALUES (84, 'spmv (12)', 'TileSpMV: A Tiled Algorithm for Sparse Matrix-V ector Multiplication on GPUs 浅读 (1)', '2023-01-16 14:30:42', '2023-01-16 14:30:42', 11, '论文', 0);
INSERT INTO `article` VALUES (85, 'spmv (13)', 'TileSpMV: A Tiled Algorithm for Sparse Matrix-V ector Multiplication on GPUs 浅读 (2)', '2023-01-17 14:39:14', '2023-01-17 14:39:14', 11, '论文', 0);
INSERT INTO `article` VALUES (86, 'spmv (14)', 'CSR5：An Efficient Storage Format for Cross-Platform Sparse Matrix-Vector Multiplication 源码解读 (1)（cuda代码）', '2023-01-18 15:52:30', '2023-01-18 15:52:30', 12, '源码', 0);
INSERT INTO `article` VALUES (87, 'spmv (15)', 'CSR5：An Efficient Storage Format for Cross-Platform Sparse Matrix-Vector Multiplication 源码解读 (2)（cuda代码）', '2023-01-20 18:48:17', '2023-01-20 18:48:17', 12, '源码', 0);
INSERT INTO `article` VALUES (88, 'spmv (16)', 'CSR5：An Efficient Storage Format for Cross-Platform Sparse Matrix-Vector Multiplication 源码解读 (3)（avx2/512代码）', '2023-01-30 10:49:00', '2023-01-30 10:49:00', 12, '源码', 0);
INSERT INTO `article` VALUES (89, 'spmv (17)', 'CSR5：An Efficient Storage Format for Cross-Platform Sparse Matrix-Vector Multiplication 源码解读 (4)（avx2/512代码）', '2023-02-01 15:01:16', '2023-02-01 15:01:16', 12, '源码', 0);
INSERT INTO `article` VALUES (90, 'spmv (18)', 'LightSpMV-FasterCSR-basedsparsematrix-vectormultiplicationonCUDA-enabledGPUs 浅读 (1)', '2023-02-15 14:53:21', '2023-02-15 14:53:21', 11, '论文', 0);
INSERT INTO `article` VALUES (91, 'spmv (19)', 'LightSpMV-FasterCSR-basedsparsematrix-vectormultiplicationonCUDA-enabledGPUs 浅读 (2)', '2023-02-17 15:09:19', '2023-02-17 15:09:19', 11, '论文', 0);
INSERT INTO `article` VALUES (92, 'spmv (2)', 'Speculative Segmented Sum for Sparse Matrix-V ector Multiplication on Heterogeneous Processors 浅读（1）,单词积累', '2023-01-06 20:00:02', '2023-01-06 20:00:02', 11, '论文', 0);
INSERT INTO `article` VALUES (93, 'spmv (20)', 'LightSpMV-FasterCSR-basedsparsematrix-vectormultiplicationonCUDA-enabledGPUs 浅读 (3)', '2023-03-03 19:14:44', '2023-03-03 19:14:44', 11, '论文', 0);
INSERT INTO `article` VALUES (94, 'spmv (21)', 'LightSpMV-FasterCSR-basedsparsematrix-vectormultiplicationonCUDA-enabledGPUs 源码解析 (1)', '2023-03-06 09:14:44', '2023-03-06 09:14:44', 12, '源码', 0);
INSERT INTO `article` VALUES (95, 'spmv (22)', 'LightSpMV-FasterCSR-basedsparsematrix-vectormultiplicationonCUDA-enabledGPUs 源码解析 (2)', '2023-03-06 09:14:44', '2023-03-06 09:14:44', 12, '源码', 0);
INSERT INTO `article` VALUES (96, 'spmv (23)', 'Merge-based Parallel Sparse Matrix-Sparse Vector Multiplication with a Vector Architecture浅读 (1)', '2023-03-20 13:51:44', '2023-03-20 13:51:44', 11, '论文', 0);
INSERT INTO `article` VALUES (97, 'spmv (24)', 'Merge-based Parallel Sparse Matrix-Sparse Vector Multiplication with a Vector Architecture浅读 (2)', '2023-03-21 15:23:11', '2023-03-21 15:23:11', 11, '论文', 0);
INSERT INTO `article` VALUES (98, 'spmv (25)', 'Merge-based Parallel Sparse Matrix-Vector Multiplication 浅读 (1)', '2023-03-22 14:25:11', '2023-03-22 14:25:11', 11, '论文', 0);
INSERT INTO `article` VALUES (99, 'spmv (26)', 'Merge-based Parallel Sparse Matrix-Vector Multiplication 浅读 (2)', '2023-03-26 14:31:00', '2023-03-26 14:31:00', 11, '论文', 0);
INSERT INTO `article` VALUES (100, 'spmv (27)', 'Merge-based Parallel Sparse Matrix-Vector Multiplication 源码解析 (1)', '2023-03-28 20:09:00', '2023-03-28 20:09:00', 12, '源码', 0);
INSERT INTO `article` VALUES (101, 'spmv (28)', 'Merge-based Parallel Sparse Matrix-Vector Multiplication 源码解析 (2)', '2023-03-30 20:06:00', '2023-03-30 20:06:00', 12, '源码', 0);
INSERT INTO `article` VALUES (102, 'spmv (29)', 'Merge-based Parallel Sparse Matrix-Vector Multiplication 源码解析 (3)', '2023-04-02 14:27:00', '2023-04-02 14:27:00', 12, '源码', 0);
INSERT INTO `article` VALUES (103, 'spmv (3)', 'Speculative Segmented Sum for Sparse Matrix-V ector Multiplication on Heterogeneous Processors 浅读（2）,单词积累', '2023-01-06 20:00:03', '2023-01-06 20:00:03', 11, '论文', 0);
INSERT INTO `article` VALUES (104, 'spmv (30)', 'yaSpMV: yet another SpMV framework on GPUs 浅读 (1)', '2023-04-04 15:22:00', '2023-04-04 15:22:00', 11, '论文', 0);
INSERT INTO `article` VALUES (105, 'spmv (31)', 'yaSpMV: Yet Another SpMV Framework on GPUs  浅读 (2)', '2023-04-08 20:39:00', '2023-04-08 20:39:00', 11, '论文', 0);
INSERT INTO `article` VALUES (106, 'spmv (32)', 'yaSpMV: Yet Another SpMV Framework on GPUs  浅读 (3)', '2023-04-09 20:35:00', '2023-04-09 20:35:00', 11, '论文', 0);
INSERT INTO `article` VALUES (107, 'spmv (33)', 'Performance Optimization Using Partitioned SpMV on GPUs and Multicore CPUs 浅读 (1)', '2023-04-18 16:10:00', '2023-04-18 16:10:00', 11, '论文', 0);
INSERT INTO `article` VALUES (108, 'spmv (34)', 'Performance Optimization Using Partitioned SpMV on GPUs and Multicore CPUs 浅读 (2)', '2023-04-20 20:10:00', '2023-04-20 20:10:00', 11, '论文', 0);
INSERT INTO `article` VALUES (109, 'spmv (35)', 'Merge-based Parallel Sparse Matrix-Vector Multiplication 深读 (1)', '2023-05-29 15:06:00', '2023-05-29 15:06:00', 11, '论文', 0);
INSERT INTO `article` VALUES (110, 'spmv (36)', 'CSX: An Extended Compression Format for SpMV on Shared Memory Systems 浅读 (1)', '2023-05-30 15:50:00', '2023-05-30 15:50:00', 11, '论文', 0);
INSERT INTO `article` VALUES (111, 'spmv (37)', 'Selecting optimal SpMV realizations for GPUs via machine learning浅读 (1)', '2023-06-05 15:02:00', '2023-06-05 15:02:00', 11, '论文', 0);
INSERT INTO `article` VALUES (112, 'spmv (38)', 'AlphaSparse: Generating High Performance SpMV Codes Directly from Sparse Matrices浅读 (1)', '2023-06-23 15:50:00', '2023-06-23 15:50:00', 11, '论文', 0);
INSERT INTO `article` VALUES (113, 'spmv (39)', 'AlphaSparse: Generating High Performance SpMV Codes Directly from Sparse Matrices浅读 (2)', '2023-06-26 11:00:00', '2023-06-26 11:00:00', 11, '论文', 0);
INSERT INTO `article` VALUES (114, 'spmv (4)', 'Speculative Segmented Sum for Sparse Matrix-V ector Multiplication on Heterogeneous Processors 浅读（3）', '2023-01-06 20:00:04', '2023-01-06 20:00:04', 11, '论文', 0);
INSERT INTO `article` VALUES (115, 'spmv (40)', 'AlphaSparse: Generating High Performance SpMV Codes Directly from Sparse Matrices浅读 (2)', '2023-07-03 15:08:00', '2023-07-03 15:08:00', 11, '论文', 0);
INSERT INTO `article` VALUES (116, 'spmv (41)', '性能测试工具包', '2023-07-03 16:00:00', '2023-07-03 16:00:00', 11, '论文', 0);
INSERT INTO `article` VALUES (117, 'spmv (42)', '性能测试工具包 (2)', '2023-07-04 16:00:00', '2023-07-04 16:00:00', 11, '论文', 0);
INSERT INTO `article` VALUES (118, 'spmv (43)', 'Adaptive diagonal sparse matrix-vector multiplication on GPU 浅读 (1)', '2023-07-31 09:00:00', '2023-07-31 09:00:00', 11, '论文', 0);
INSERT INTO `article` VALUES (119, 'spmv (44)', '对角矩阵优化代码进度 (1)', '2023-08-09 21:21:00', '2023-08-09 21:21:00', 11, '论文', 0);
INSERT INTO `article` VALUES (120, 'spmv (45)', '对角矩阵优化代码进度 (2)', '2023-08-30 16:15:00', '2023-08-30 16:15:00', 11, '论文', 0);
INSERT INTO `article` VALUES (121, 'spmv (5)', 'Sparse Matrix-Vector Multiplication on GPGPUs 浅读,1. 介绍,2. 关于spmv在gpgpu上的综述：,单词学习', '2023-01-06 20:00:05', '2023-01-06 20:00:05', 11, '论文', 0);
INSERT INTO `article` VALUES (122, 'spmv (6)', 'spmv之oski优化', '2023-01-06 20:00:06', '2023-01-06 20:00:06', 11, '论文', 0);
INSERT INTO `article` VALUES (123, 'spmv (7)', 'OpenMP循环调度算法及SpMV多核并行化研究 浅读', '2023-01-06 20:00:07', '2023-01-06 20:00:07', 11, '论文', 0);
INSERT INTO `article` VALUES (124, 'spmv (8)', 'CSR5：An Efficient Storage Format for Cross-Platform Sparse Matrix-Vector Multiplication 浅读 (1)', '2023-01-06 20:00:08', '2023-01-06 20:00:08', 11, '论文', 0);
INSERT INTO `article` VALUES (125, 'spmv (9)', 'CSR5：An Efficient Storage Format for Cross-Platform Sparse Matrix-Vector Multiplication 浅读 (2)', '2023-01-08 14:13:09', '2023-01-08 14:13:09', 11, '论文', 0);
INSERT INTO `article` VALUES (126, 'task (1)', '应用间歇性可再生能源的数据中心资源与能耗管理模型与算法 浅读（1）##', '2023-02-11 14:44:27', '2023-02-11 14:44:27', 27, '其他', 0);
INSERT INTO `article` VALUES (127, 'task (2)', '应用间歇性可再生能源的数据中心资源与能耗管理模型与算法 浅读（2）##', '2023-02-12 14:56:29', '2023-02-12 14:56:29', 27, '其他', 0);
INSERT INTO `article` VALUES (128, '三国演义概述', '三国演义 100 个情节', '2023-01-14 20:37:40', '2023-01-14 20:37:40', 27, '其他', 0);
INSERT INTO `article` VALUES (129, '常用命令（1）', '', '2023-09-22 19:52:00', '2023-09-22 19:52:00', 27, '其他', 0);
INSERT INTO `article` VALUES (130, '苍穹外卖 (1)', '环境搭建,完善登陆功能,思考', '2023-10-16 21:10:00', '2023-10-16 21:10:00', 28, '苍穹外卖', 0);
INSERT INTO `article` VALUES (131, '苍穹外卖 (10)', '缓存菜品,缓存套餐,添加购物车,查看购物车,清空购物车', '2023-11-05 20:33:00', '2023-11-05 20:33:00', 28, '苍穹外卖', 0);
INSERT INTO `article` VALUES (132, '苍穹外卖 (11)', '导入地址相关代码,用户下单,订单支付', '2023-11-06 20:33:00', '2023-11-06 20:33:00', 28, '苍穹外卖', 0);
INSERT INTO `article` VALUES (133, '苍穹外卖 (12)', '历史订单查询,查询订单详情,取消订单,再来一单,订单搜索,各个状态的订单数量统计,查询订单详情,接单,拒单,取消订单,派送订单,完成订单,优化用户下单,windwos后台启动程序,前后端数据传参的区别(@RequestParam,@PathVariable和@RequestBody)', '2023-11-09 21:00:00', '2023-11-09 21:00:00', 28, '苍穹外卖', 0);
INSERT INTO `article` VALUES (134, '苍穹外卖 (13)', 'Spring task,订单状态定时处理,来单提醒,客户催单', '2023-11-11 21:00:00', '2023-11-11 21:00:00', 28, '苍穹外卖', 0);
INSERT INTO `article` VALUES (135, '苍穹外卖 (14)', '营业额统计,用户统计,订单统计,销量统计', '2023-11-12 14:00:00', '2023-11-12 14:00:00', 28, '苍穹外卖', 0);
INSERT INTO `article` VALUES (136, '苍穹外卖 (15)', '数据报表导出', '2023-11-12 14:00:00', '2023-11-12 14:00:00', 28, '苍穹外卖', 0);
INSERT INTO `article` VALUES (137, '苍穹外卖 (2)', '新增员工,代码完善,员工分页查询', '2023-10-17 19:56:00', '2023-10-17 19:56:00', 28, '苍穹外卖', 0);
INSERT INTO `article` VALUES (138, '苍穹外卖 (3)', '启用禁用员工账号,编辑员工', '2023-10-19 20:15:00', '2023-10-19 20:15:00', 28, '苍穹外卖', 0);
INSERT INTO `article` VALUES (139, '苍穹外卖 (4)', '公共字段填充,新增菜品,菜品分页查询', '2023-10-20 21:00:00', '2023-10-20 21:00:00', 28, '苍穹外卖', 0);
INSERT INTO `article` VALUES (140, '苍穹外卖 (5)', '删除菜品,修改菜品(包括根据id查菜品+修改菜品)', '2023-10-21 15:33:00', '2023-10-21 15:33:00', 28, '苍穹外卖', 0);
INSERT INTO `article` VALUES (141, '苍穹外卖 (6)', '新增套餐（分为根据分类id查询菜品，完善修改菜品销售状态，新增套餐）,套餐分页查询,删除套餐,修改套餐(分为根据id查询套餐+修改套餐),起售停售套餐', '2023-10-22 10:22:00', '2023-10-22 10:22:00', 28, '苍穹外卖', 0);
INSERT INTO `article` VALUES (142, '苍穹外卖 (7)', 'Windows-Redis安装与运行,Redis常用命令,JAVA中操作Redis', '2023-10-25 19:58:00', '2023-10-25 19:58:00', 28, '苍穹外卖', 0);
INSERT INTO `article` VALUES (143, '苍穹外卖 (8)', '店铺营业状态设置', '2023-10-26 19:59:00', '2023-10-26 19:59:00', 28, '苍穹外卖', 0);
INSERT INTO `article` VALUES (144, '苍穹外卖 (9)', 'Http Client,微信登陆', '2023-11-01 20:33:00', '2023-11-01 20:33:00', 28, '苍穹外卖', 0);
INSERT INTO `article` VALUES (145, '观影感想（1）', '', '2022-11-23 20:00:30', '2022-11-23 20:00:30', 27, '其他', 0);
INSERT INTO `article` VALUES (146, '观影感想（2）', '', '2022-11-23 20:00:30', '2022-11-23 20:00:30', 27, '其他', 0);
INSERT INTO `article` VALUES (151, 'Docker(1)', 'docker常用命令，部署流程，别名', '2024-01-18 15:11:46', '2024-01-18 15:51:28', 29, 'Docker', 0);
INSERT INTO `article` VALUES (152, 'Docker(2)', 'docker数据卷和本地目录挂载,dockerfile自定义镜像', '2024-01-18 16:29:23', '2024-01-18 16:57:08', 29, 'Docker', 0);
INSERT INTO `article` VALUES (153, 'Docker(3)', 'Docker容器网络互联，DockerCompose', '2024-01-19 09:58:51', '2024-01-19 10:26:47', 29, 'Docker', 0);
INSERT INTO `article` VALUES (154, 'Nacos(1)', '主要解决问题，原理，流程', '2024-01-24 11:02:07', '2024-02-07 22:02:20', 30, 'Nacos', 0);
INSERT INTO `article` VALUES (155, 'Nacos(2)', 'nacos服务端部署，服务注册，服务发现', '2024-01-24 11:23:50', '2024-02-07 22:02:11', 30, 'Nacos', 0);
INSERT INTO `article` VALUES (156, 'OpenFeign(1)', 'OpenFeign快速入门，连接池', '2024-01-24 16:43:40', '2024-02-07 22:01:59', 31, 'OpenFeign', 0);
INSERT INTO `article` VALUES (157, 'OpenFeign(2)', '拆分思路,日志配置', '2024-01-25 09:21:36', '2024-02-07 22:01:52', 31, 'OpenFeign', 1);
INSERT INTO `article` VALUES (158, '网关路由Gateway(1)', 'gateway介绍,配置部署，路由属性，路由断言，路由过滤', '2024-01-25 15:32:14', '2024-02-07 22:01:43', 32, 'GateWay', 0);
INSERT INTO `article` VALUES (159, '网关路由Gateway(2)', '网关登录校验,自定义过滤器,微服务获取用户,openfeign传递用户', '2024-01-25 20:42:13', '2024-02-07 22:01:37', 32, 'GateWay', 0);
INSERT INTO `article` VALUES (160, 'nacos(3)', 'nacos配置管理', '2024-01-26 09:55:47', '2024-02-07 22:01:24', 30, 'Nacos', 0);
INSERT INTO `article` VALUES (162, '微服务保护Sentinel(1)', '微服务保护方案，Sentinel介绍与安装，微服务整合，', '2024-02-07 22:27:36', '2024-02-07 22:27:36', 33, 'Sentinel', 0);
INSERT INTO `article` VALUES (163, '微服务保护Sentinel(2)', '请求限流,线程隔离,服务熔断', '2024-02-07 22:38:07', '2024-02-07 22:38:07', 33, 'Sentinel', 0);
INSERT INTO `article` VALUES (164, 'JAVA集合(1)', 'java集合的接口继承和实现、List、Set', '2024-02-23 10:20:11', '2024-02-23 10:44:18', 34, 'JAVA基础', 0);
INSERT INTO `article` VALUES (165, 'JAVA集合(2)', 'java map', '2024-02-24 09:44:35', '2024-02-24 09:44:35', 34, 'JAVA基础', 0);
INSERT INTO `article` VALUES (166, 'JAVA多线程(1)', '并发编程三要素、synchronized、volatile、CAS', '2024-02-24 15:12:00', '2024-02-24 15:12:00', 35, 'JAVA多线程', 0);
INSERT INTO `article` VALUES (167, 'JAVA多线程(2)', 'ReentrantLock 、AQS、CopyOnWriteArrayList、CountDownLatch、CyclicBarrier、Semaphore', '2024-02-25 10:29:24', '2024-02-25 10:29:24', 35, 'JAVA多线程', 0);
INSERT INTO `article` VALUES (168, 'JAVA多线程(3)', '锁分类、锁状态', '2024-02-25 10:44:37', '2024-02-25 10:44:37', 35, 'JAVA多线程', 0);
INSERT INTO `article` VALUES (169, 'JAVA多线程(4)', '守护线程、线程状态、线程基本方法、ThreadLocal', '2024-02-25 11:03:25', '2024-02-25 11:03:25', 35, 'JAVA多线程', 0);
INSERT INTO `article` VALUES (170, 'JAVA多线程(5)', '线程池', '2024-02-25 11:11:45', '2024-02-25 11:11:45', 35, 'JAVA多线程', 0);
INSERT INTO `article` VALUES (171, 'JAVA多线程(6)', 'AQS(AbstractQueuedSynchronizer)源码,ReentrantLock实现', '2024-02-26 10:32:02', '2024-02-26 12:00:22', 35, 'JAVA多线程', 0);
INSERT INTO `article` VALUES (172, 'JAVA多线程(7)', 'Semaphore源码分析', '2024-02-27 10:04:29', '2024-02-27 10:04:29', 35, 'JAVA多线程', 0);
INSERT INTO `article` VALUES (173, 'Spring AOP', 'AOP相关的知识点', '2024-03-09 10:03:55', '2024-03-09 10:08:36', 36, 'Spring', 0);
INSERT INTO `article` VALUES (174, 'Spring IOC', 'IOC相关知识', '2024-03-09 10:07:21', '2024-04-04 15:31:32', 36, 'Spring', 0);
INSERT INTO `article` VALUES (175, 'RabbitMQ', 'RabbitMQ面试相关', '2024-03-09 16:08:52', '2024-03-17 20:26:52', 37, 'RabbitMQ', 0);
INSERT INTO `article` VALUES (176, '外卖项目面试题-基础', '基础的外卖项目面试题', '2024-03-10 16:03:04', '2024-03-10 16:03:04', 38, '项目相关', 0);
INSERT INTO `article` VALUES (177, 'ElasticSearch部署', 'es在服务器上使用docker部署', '2024-03-13 11:27:21', '2024-03-13 11:27:21', 39, 'ElasticSearch', 0);
INSERT INTO `article` VALUES (178, '数据库基础(1)', '数据库相关知识基础', '2024-03-14 20:56:47', '2024-03-14 20:56:47', 40, 'MySQL', 0);
INSERT INTO `article` VALUES (179, '数据库基础(2)', '数据库优化、锁等', '2024-03-16 15:26:21', '2024-03-16 15:26:21', 40, 'MySQL', 0);
INSERT INTO `article` VALUES (180, 'Spring MVC', 'Spring MVC', '2024-03-16 15:54:49', '2024-03-16 15:54:49', 36, 'Spring', 0);
INSERT INTO `article` VALUES (181, 'SpringBoot', 'SpringBoot相关面试题', '2024-03-17 14:51:54', '2024-04-06 14:51:08', 36, 'Spring', 0);
INSERT INTO `article` VALUES (182, 'Mybatis', 'Mybatis相关面试题', '2024-03-17 15:05:24', '2024-03-17 15:05:24', 36, 'Spring', 2);
INSERT INTO `article` VALUES (183, 'Redis', 'Redis相关面试题', '2024-03-17 15:17:34', '2024-03-17 15:48:59', 41, 'Redis', 4);
INSERT INTO `article` VALUES (184, '《计算机应用》期刊投稿流程', '《计算机应用》期刊投稿流程', '2024-03-24 11:27:43', '2024-03-24 11:27:43', 27, '其他', 6);
INSERT INTO `article` VALUES (185, 'Redis集群相关', 'Redis集群相关', '2024-03-28 15:45:06', '2024-03-28 15:45:06', 41, 'Redis', 2);
INSERT INTO `article` VALUES (186, '计算机网络面试题', '计算机网络面试题', '2024-04-03 16:51:43', '2024-04-03 16:51:43', 43, '408相关', 16);

-- ----------------------------
-- Table structure for articlelike
-- ----------------------------
DROP TABLE IF EXISTS `articlelike`;
CREATE TABLE `articlelike`  (
  `articleId` int NOT NULL,
  `articleTitle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `likeNum` int NULL DEFAULT NULL,
  `loveNum` int NULL DEFAULT NULL,
  `smileNum` int NULL DEFAULT NULL,
  PRIMARY KEY (`articleId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of articlelike
-- ----------------------------
INSERT INTO `articlelike` VALUES (23, '2023-10-4总结', 0, 0, 0);
INSERT INTO `articlelike` VALUES (58, 'cuda (5)', 0, 0, 0);
INSERT INTO `articlelike` VALUES (60, 'gdb（1）', 1, 0, 0);
INSERT INTO `articlelike` VALUES (61, 'IDEA快捷键', 0, 0, 0);
INSERT INTO `articlelike` VALUES (62, 'JVM(1)', 0, 0, 0);
INSERT INTO `articlelike` VALUES (63, 'JVM(2)', 0, 0, 0);
INSERT INTO `articlelike` VALUES (66, 'mc64 (1)', 0, 0, 0);
INSERT INTO `articlelike` VALUES (67, 'mc64 (10)', 0, 0, 0);
INSERT INTO `articlelike` VALUES (68, 'mc64 (2)', 0, 0, 0);
INSERT INTO `articlelike` VALUES (72, 'mc64 (6)', 0, 0, 0);
INSERT INTO `articlelike` VALUES (73, 'mc64 (7)', 0, 0, 0);
INSERT INTO `articlelike` VALUES (74, 'mc64 (8)', 0, 0, 0);
INSERT INTO `articlelike` VALUES (75, 'mc64 (9)', 0, 0, 0);
INSERT INTO `articlelike` VALUES (76, 'pac (1)', 0, 0, 0);
INSERT INTO `articlelike` VALUES (77, 'pac (2)', 0, 0, 0);
INSERT INTO `articlelike` VALUES (82, 'spmv (10)', 1, 0, 0);
INSERT INTO `articlelike` VALUES (128, '三国演义概述', 0, 0, 0);
INSERT INTO `articlelike` VALUES (130, '苍穹外卖 (1)', 0, 0, 0);
INSERT INTO `articlelike` VALUES (132, '苍穹外卖 (11)', 0, 0, 0);
INSERT INTO `articlelike` VALUES (133, '苍穹外卖 (12)', 0, 0, 0);
INSERT INTO `articlelike` VALUES (135, '苍穹外卖 (14)', 0, 0, 0);
INSERT INTO `articlelike` VALUES (142, '苍穹外卖 (7)', 0, 0, 0);
INSERT INTO `articlelike` VALUES (151, 'Docker(1)', 0, 0, 0);
INSERT INTO `articlelike` VALUES (152, 'Docker(2)', 0, 0, 0);
INSERT INTO `articlelike` VALUES (153, 'Docker(3)', 0, 0, 0);
INSERT INTO `articlelike` VALUES (154, 'Nacos(1)', 0, 0, 0);
INSERT INTO `articlelike` VALUES (155, 'Nacos(2)', 0, 0, 0);
INSERT INTO `articlelike` VALUES (156, 'OpenFeign(1)', 0, 0, 0);
INSERT INTO `articlelike` VALUES (157, 'OpenFeign(2)', 0, 0, 0);
INSERT INTO `articlelike` VALUES (158, '网关路由Gateway(1)', 0, 0, 0);
INSERT INTO `articlelike` VALUES (159, '网关路由Gateway(2)', 0, 0, 0);
INSERT INTO `articlelike` VALUES (160, 'nacos(3)', 0, 0, 0);
INSERT INTO `articlelike` VALUES (162, '微服务保护Sentinel(1)', 0, 0, 0);
INSERT INTO `articlelike` VALUES (164, 'JAVA集合(1)', 0, 0, 0);
INSERT INTO `articlelike` VALUES (165, 'JAVA集合(2)', 0, 0, 0);
INSERT INTO `articlelike` VALUES (166, 'JAVA多线程(1)', 0, 0, 0);
INSERT INTO `articlelike` VALUES (167, 'JAVA多线程(2)', 0, 0, 0);
INSERT INTO `articlelike` VALUES (168, 'JAVA多线程(3)', 0, 0, 0);
INSERT INTO `articlelike` VALUES (169, 'JAVA多线程(4)', 0, 0, 0);
INSERT INTO `articlelike` VALUES (170, 'JAVA多线程(5)', 0, 0, 0);
INSERT INTO `articlelike` VALUES (171, 'JAVA多线程(6)', 1, 1, 0);
INSERT INTO `articlelike` VALUES (172, 'JAVA多线程(7)', 3, 1, 1);
INSERT INTO `articlelike` VALUES (173, 'Spring AOP', 0, 0, 0);
INSERT INTO `articlelike` VALUES (174, 'Spring IOC', 0, 1, 0);
INSERT INTO `articlelike` VALUES (175, 'RabbitMQ(1)', 0, 0, 0);
INSERT INTO `articlelike` VALUES (176, '外卖项目面试题-基础', 0, 0, 0);
INSERT INTO `articlelike` VALUES (177, 'ElasticSearch部署', 0, 0, 0);
INSERT INTO `articlelike` VALUES (178, '数据库基础(1)', 0, 0, 0);
INSERT INTO `articlelike` VALUES (179, '数据库基础(2)', 0, 0, 0);
INSERT INTO `articlelike` VALUES (180, 'Spring MVC', 0, 0, 0);
INSERT INTO `articlelike` VALUES (181, 'SpringBoot', 0, 0, 0);
INSERT INTO `articlelike` VALUES (182, 'Mybatis', 1, 0, 0);
INSERT INTO `articlelike` VALUES (183, 'Redis', 1, 0, 0);
INSERT INTO `articlelike` VALUES (184, '《计算机应用》期刊投稿流程', 2, 1, 0);
INSERT INTO `articlelike` VALUES (185, 'Redis集群相关', 1, 0, 0);
INSERT INTO `articlelike` VALUES (186, '计算机网络面试题', 1, 0, 0);
INSERT INTO `articlelike` VALUES (215, 'test222', 1, 1, 0);

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `parentId` int NULL DEFAULT NULL,
  `level` int NULL DEFAULT NULL,
  `number` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 46 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES (1, 'Java', -1, 0, 52);
INSERT INTO `categories` VALUES (2, '科研', -1, 0, 60);
INSERT INTO `categories` VALUES (3, '高性能', -1, 0, 6);
INSERT INTO `categories` VALUES (4, '日常', -1, 0, 53);
INSERT INTO `categories` VALUES (5, '相关技术', 1, 1, 15);
INSERT INTO `categories` VALUES (6, '面经', 1, 1, 21);
INSERT INTO `categories` VALUES (7, '实战项目', 1, 1, 15);
INSERT INTO `categories` VALUES (8, 'JVM', 5, 2, 2);
INSERT INTO `categories` VALUES (9, 'Spring Cloud', 5, 2, 10);
INSERT INTO `categories` VALUES (10, 'SpMV', 2, 1, 45);
INSERT INTO `categories` VALUES (11, '论文', 10, 2, 36);
INSERT INTO `categories` VALUES (12, '源码', 10, 2, 9);
INSERT INTO `categories` VALUES (13, 'Spmm', 2, 1, 3);
INSERT INTO `categories` VALUES (14, 'CUDA', 3, 1, 6);
INSERT INTO `categories` VALUES (15, '个人总结', 4, 1, 53);
INSERT INTO `categories` VALUES (20, 'Linux', -1, 0, 1);
INSERT INTO `categories` VALUES (21, 'GDB', 20, 1, 1);
INSERT INTO `categories` VALUES (22, 'IDEA', 1, 1, 1);
INSERT INTO `categories` VALUES (23, '论文相关', 2, 1, 2);
INSERT INTO `categories` VALUES (24, 'MC64', 2, 1, 10);
INSERT INTO `categories` VALUES (25, '竞赛', -1, 0, 2);
INSERT INTO `categories` VALUES (26, 'PAC', 25, 1, 2);
INSERT INTO `categories` VALUES (27, '其他', -1, 0, 7);
INSERT INTO `categories` VALUES (28, '苍穹外卖', 7, 2, 15);
INSERT INTO `categories` VALUES (29, 'Docker', 5, 2, 3);
INSERT INTO `categories` VALUES (30, 'Nacos', 9, 3, 3);
INSERT INTO `categories` VALUES (31, 'OpenFeign', 9, 3, 2);
INSERT INTO `categories` VALUES (32, 'GateWay', 9, 3, 2);
INSERT INTO `categories` VALUES (33, 'Sentinel', 9, 3, 2);
INSERT INTO `categories` VALUES (34, 'JAVA基础', 6, 2, 2);
INSERT INTO `categories` VALUES (35, 'JAVA多线程', 6, 2, 7);
INSERT INTO `categories` VALUES (36, 'Spring', 6, 2, 5);
INSERT INTO `categories` VALUES (37, 'RabbitMQ', 6, 2, 1);
INSERT INTO `categories` VALUES (38, '项目相关', 6, 2, 1);
INSERT INTO `categories` VALUES (39, 'ElasticSearch', 9, 3, 1);
INSERT INTO `categories` VALUES (40, 'MySQL', 6, 2, 2);
INSERT INTO `categories` VALUES (41, 'Redis', 6, 2, 2);
INSERT INTO `categories` VALUES (42, 'PyTorch', 2, 1, 0);
INSERT INTO `categories` VALUES (43, '408相关', 6, 2, 1);
INSERT INTO `categories` VALUES (44, '微服务相关', 6, 2, 0);

-- ----------------------------
-- Table structure for memo
-- ----------------------------
DROP TABLE IF EXISTS `memo`;
CREATE TABLE `memo`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `tag` int NULL DEFAULT NULL,
  `createTime` datetime NULL DEFAULT NULL,
  `date` datetime NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of memo
-- ----------------------------
INSERT INTO `memo` VALUES (1, '吃饭', 1, '2023-12-20 10:12:33', '2023-12-20 10:12:36', 0);
INSERT INTO `memo` VALUES (2, 'test', 1, '2024-01-05 16:26:57', '2024-01-05 08:00:00', 0);
INSERT INTO `memo` VALUES (3, 'test', 0, '2024-01-10 09:50:43', '2024-01-10 08:00:00', 1);
INSERT INTO `memo` VALUES (4, 'ddd', 2, '2024-03-04 23:13:51', '2024-03-04 08:00:00', 1);
INSERT INTO `memo` VALUES (6, 'test', 0, '2024-09-05 16:56:33', '2024-09-05 08:00:00', 0);

-- ----------------------------
-- Table structure for month_growth
-- ----------------------------
DROP TABLE IF EXISTS `month_growth`;
CREATE TABLE `month_growth`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `date` date NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `nums` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of month_growth
-- ----------------------------
INSERT INTO `month_growth` VALUES (7, '2024-08-01', 'likeNums', 100);
INSERT INTO `month_growth` VALUES (9, '2024-09-01', 'pageViews', 5);
INSERT INTO `month_growth` VALUES (10, '2024-09-01', 'likeNums', 150);

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `operation` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '操作',
  `business_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '业务类型',
  `method` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `create_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `params` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '参数',
  `ip` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求的ip地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 383 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '操作日志记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (1, '查询memo', 'LIST', 'com.mblog.controller.admin.MemoControllergetMemoListByTime', '2024-07-24 16:43:29', '[\"2024-07-24\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (2, '查询memo', 'LIST', 'com.mblog.controller.admin.MemoControllergetMemoListByTime', '2024-07-24 16:49:03', '[\"2024-07-24\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (3, '根据分类名称和每页大小以及第几页获取文章信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticlesByCategoryNameAndPage', '2024-07-25 11:11:04', '[null,null,null]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (4, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 11:11:16', '[\"Redis集群相关\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (5, '根据分类名称和每页大小以及第几页获取文章信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticlesByCategoryNameAndPage', '2024-07-25 11:12:02', '[null,null,null]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (6, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 11:12:31', '[\"计算机网络面试题\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (7, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 11:22:39', '[\"计算机网络面试题\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (8, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 11:23:14', '[\"计算机网络面试题\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (9, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 11:23:16', '[\"计算机网络面试题\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (10, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 11:24:01', '[\"计算机网络面试题\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (11, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 11:24:03', '[\"计算机网络面试题\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (12, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 13:49:19', '[\"计算机网络面试题\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (13, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 13:49:53', '[\"计算机网络面试题\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (14, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 13:51:05', '[\"计算机网络面试题\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (15, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 13:51:27', '[\"计算机网络面试题\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (16, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 13:52:14', '[\"计算机网络面试题\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (17, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 13:52:34', '[\"计算机网络面试题\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (18, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 13:53:15', '[\"计算机网络面试题\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (19, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 13:54:03', '[\"计算机网络面试题\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (20, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 13:55:04', '[\"计算机网络面试题\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (21, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 13:55:22', '[\"计算机网络面试题\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (22, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 13:55:28', '[\"计算机网络面试题\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (23, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 13:55:31', '[\"计算机网络面试题\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (24, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 13:56:10', '[\"计算机网络面试题\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (25, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 13:56:14', '[\"计算机网络面试题\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (26, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 13:56:19', '[\"计算机网络面试题\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (27, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 13:58:24', '[\"计算机网络面试题\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (28, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 13:58:40', '[\"计算机网络面试题\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (29, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 13:58:49', '[\"计算机网络面试题\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (30, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 13:59:28', '[\"计算机网络面试题\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (31, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 13:59:28', '[\"计算机网络面试题\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (32, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 13:59:29', '[\"计算机网络面试题\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (33, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 13:59:46', '[\"计算机网络面试题\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (34, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 13:59:47', '[\"计算机网络面试题\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (35, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 13:59:56', '[\"计算机网络面试题\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (36, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 14:00:04', '[\"计算机网络面试题\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (37, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 14:00:47', '[\"计算机网络面试题\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (38, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 14:00:54', '[\"计算机网络面试题\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (39, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 14:00:56', '[\"计算机网络面试题\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (40, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 14:01:10', '[\"计算机网络面试题\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (41, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 14:01:10', '[\"计算机网络面试题\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (42, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 14:01:11', '[\"计算机网络面试题\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (43, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 14:01:18', '[\"计算机网络面试题\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (44, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 14:01:37', '[\"计算机网络面试题\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (45, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 14:01:40', '[\"计算机网络面试题\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (46, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 14:02:06', '[\"计算机网络面试题\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (47, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 14:03:41', '[\"计算机网络面试题\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (48, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 14:03:43', '[\"计算机网络面试题\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (49, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 14:03:50', '[\"计算机网络面试题\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (50, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 14:04:02', '[\"计算机网络面试题\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (51, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 14:04:05', '[\"计算机网络面试题\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (52, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 14:04:11', '[\"计算机网络面试题\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (53, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 14:04:14', '[\"计算机网络面试题\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (54, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 14:04:44', '[\"计算机网络面试题\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (55, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 14:05:10', '[\"计算机网络面试题\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (56, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 14:05:31', '[\"计算机网络面试题\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (57, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 14:06:04', '[\"计算机网络面试题\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (58, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 14:06:06', '[\"计算机网络面试题\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (59, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 14:07:24', '[\"计算机网络面试题\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (60, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 14:07:41', '[\"计算机网络面试题\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (61, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 14:08:05', '[\"计算机网络面试题\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (62, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 14:08:16', '[\"计算机网络面试题\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (63, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 14:08:22', '[\"计算机网络面试题\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (64, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 14:11:23', '[\"计算机网络面试题\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (65, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 14:11:41', '[\"计算机网络面试题\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (66, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 14:11:50', '[\"计算机网络面试题\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (67, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 14:12:13', '[\"计算机网络面试题\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (68, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 14:12:53', '[\"计算机网络面试题\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (69, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 14:15:32', '[\"计算机网络面试题\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (70, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 14:15:36', '[\"计算机网络面试题\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (71, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 14:15:59', '[\"计算机网络面试题\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (72, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 14:16:03', '[\"计算机网络面试题\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (73, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 14:16:05', '[\"计算机网络面试题\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (74, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 14:16:07', '[\"计算机网络面试题\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (75, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 14:16:13', '[\"计算机网络面试题\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (76, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 14:16:46', '[\"计算机网络面试题\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (77, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 14:16:48', '[\"计算机网络面试题\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (78, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 14:16:50', '[\"计算机网络面试题\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (79, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 14:17:14', '[\"计算机网络面试题\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (80, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 14:17:17', '[\"计算机网络面试题\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (81, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 14:17:42', '[\"计算机网络面试题\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (82, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 14:18:59', '[\"计算机网络面试题\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (83, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 14:29:30', '[\"计算机网络面试题\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (84, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 14:29:45', '[\"计算机网络面试题\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (85, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 14:30:05', '[\"计算机网络面试题\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (86, '根据分类名称和每页大小以及第几页获取文章信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticlesByCategoryNameAndPage', '2024-07-25 14:30:24', '[null,null,null]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (87, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 14:30:29', '[\"《计算机应用》期刊投稿流程\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (88, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 15:25:02', '[\"《计算机应用》期刊投稿流程\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (89, '获取用户的点赞相关信息和文章信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetUserLike', '2024-07-25 15:25:02', '[{\"browserId\":\"570f7ebb8ad6f035d3e869d83497f65e\",\"articleTitle\":\"《计算机应用》期刊投稿流程\",\"likeflag\":0,\"loveflag\":0,\"smileflag\":0}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (90, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 15:26:40', '[\"《计算机应用》期刊投稿流程\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (91, '获取用户的点赞相关信息和文章信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetUserLike', '2024-07-25 15:26:40', '[{\"browserId\":\"570f7ebb8ad6f035d3e869d83497f65e\",\"articleTitle\":\"《计算机应用》期刊投稿流程\",\"likeflag\":0,\"loveflag\":0,\"smileflag\":0}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (92, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 15:27:01', '[\"《计算机应用》期刊投稿流程\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (93, '获取用户的点赞相关信息和文章信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetUserLike', '2024-07-25 15:27:01', '[{\"browserId\":\"570f7ebb8ad6f035d3e869d83497f65e\",\"articleTitle\":\"《计算机应用》期刊投稿流程\",\"likeflag\":0,\"loveflag\":0,\"smileflag\":0}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (94, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 15:27:22', '[\"《计算机应用》期刊投稿流程\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (95, '获取用户的点赞相关信息和文章信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetUserLike', '2024-07-25 15:27:22', '[{\"browserId\":\"570f7ebb8ad6f035d3e869d83497f65e\",\"articleTitle\":\"《计算机应用》期刊投稿流程\",\"likeflag\":0,\"loveflag\":0,\"smileflag\":0}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (96, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 15:28:31', '[\"《计算机应用》期刊投稿流程\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (97, '获取用户的点赞相关信息和文章信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetUserLike', '2024-07-25 15:28:31', '[{\"browserId\":\"570f7ebb8ad6f035d3e869d83497f65e\",\"articleTitle\":\"《计算机应用》期刊投稿流程\",\"likeflag\":0,\"loveflag\":0,\"smileflag\":0}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (98, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 15:28:37', '[\"《计算机应用》期刊投稿流程\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (99, '获取用户的点赞相关信息和文章信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetUserLike', '2024-07-25 15:28:37', '[{\"browserId\":\"570f7ebb8ad6f035d3e869d83497f65e\",\"articleTitle\":\"《计算机应用》期刊投稿流程\",\"likeflag\":0,\"loveflag\":0,\"smileflag\":0}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (100, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 15:29:58', '[\"《计算机应用》期刊投稿流程\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (101, '获取用户的点赞相关信息和文章信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetUserLike', '2024-07-25 15:29:58', '[{\"browserId\":\"570f7ebb8ad6f035d3e869d83497f65e\",\"articleTitle\":\"《计算机应用》期刊投稿流程\",\"likeflag\":0,\"loveflag\":0,\"smileflag\":0}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (102, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 15:30:53', '[\"《计算机应用》期刊投稿流程\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (103, '获取用户的点赞相关信息和文章信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetUserLike', '2024-07-25 15:30:53', '[{\"browserId\":\"570f7ebb8ad6f035d3e869d83497f65e\",\"articleTitle\":\"《计算机应用》期刊投稿流程\",\"likeflag\":0,\"loveflag\":0,\"smileflag\":0}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (104, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 15:30:56', '[\"《计算机应用》期刊投稿流程\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (105, '获取用户的点赞相关信息和文章信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetUserLike', '2024-07-25 15:30:56', '[{\"browserId\":\"570f7ebb8ad6f035d3e869d83497f65e\",\"articleTitle\":\"《计算机应用》期刊投稿流程\",\"likeflag\":0,\"loveflag\":0,\"smileflag\":0}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (106, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 15:31:40', '[\"《计算机应用》期刊投稿流程\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (107, '获取用户的点赞相关信息和文章信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetUserLike', '2024-07-25 15:31:40', '[{\"browserId\":\"570f7ebb8ad6f035d3e869d83497f65e\",\"articleTitle\":\"《计算机应用》期刊投稿流程\",\"likeflag\":0,\"loveflag\":0,\"smileflag\":0}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (108, '根据分类名称和每页大小以及第几页获取文章信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticlesByCategoryNameAndPage', '2024-07-25 15:32:08', '[null,null,null]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (109, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 15:32:09', '[\"计算机网络面试题\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (110, '获取用户的点赞相关信息和文章信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetUserLike', '2024-07-25 15:32:09', '[{\"browserId\":\"570f7ebb8ad6f035d3e869d83497f65e\",\"articleTitle\":\"计算机网络面试题\",\"likeflag\":0,\"loveflag\":0,\"smileflag\":0}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (111, '根据分类名称和每页大小以及第几页获取文章信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticlesByCategoryNameAndPage', '2024-07-25 15:32:46', '[null,null,null]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (112, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 15:32:48', '[\"Mybatis\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (113, '获取用户的点赞相关信息和文章信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetUserLike', '2024-07-25 15:32:48', '[{\"browserId\":\"570f7ebb8ad6f035d3e869d83497f65e\",\"articleTitle\":\"Mybatis\",\"likeflag\":0,\"loveflag\":0,\"smileflag\":0}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (114, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 15:38:11', '[\"Mybatis\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (115, '获取用户的点赞相关信息和文章信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetUserLike', '2024-07-25 15:38:11', '[{\"browserId\":\"570f7ebb8ad6f035d3e869d83497f65e\",\"articleTitle\":\"Mybatis\",\"likeflag\":0,\"loveflag\":0,\"smileflag\":0}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (116, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 15:38:11', '[\"Mybatis\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (117, '获取用户的点赞相关信息和文章信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetUserLike', '2024-07-25 15:38:11', '[{\"browserId\":\"570f7ebb8ad6f035d3e869d83497f65e\",\"articleTitle\":\"Mybatis\",\"likeflag\":0,\"loveflag\":0,\"smileflag\":0}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (118, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 15:38:11', '[\"Mybatis\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (119, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 15:38:11', '[\"Mybatis\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (120, '获取用户的点赞相关信息和文章信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetUserLike', '2024-07-25 15:38:11', '[{\"browserId\":\"570f7ebb8ad6f035d3e869d83497f65e\",\"articleTitle\":\"Mybatis\",\"likeflag\":0,\"loveflag\":0,\"smileflag\":0}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (121, '获取用户的点赞相关信息和文章信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetUserLike', '2024-07-25 15:38:11', '[{\"browserId\":\"570f7ebb8ad6f035d3e869d83497f65e\",\"articleTitle\":\"Mybatis\",\"likeflag\":0,\"loveflag\":0,\"smileflag\":0}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (122, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 15:38:11', '[\"Mybatis\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (123, '获取用户的点赞相关信息和文章信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetUserLike', '2024-07-25 15:38:12', '[{\"browserId\":\"570f7ebb8ad6f035d3e869d83497f65e\",\"articleTitle\":\"Mybatis\",\"likeflag\":0,\"loveflag\":0,\"smileflag\":0}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (124, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 15:38:12', '[\"Mybatis\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (125, '获取用户的点赞相关信息和文章信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetUserLike', '2024-07-25 15:38:12', '[{\"browserId\":\"570f7ebb8ad6f035d3e869d83497f65e\",\"articleTitle\":\"Mybatis\",\"likeflag\":0,\"loveflag\":0,\"smileflag\":0}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (126, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 15:38:26', '[\"Mybatis\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (127, '获取用户的点赞相关信息和文章信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetUserLike', '2024-07-25 15:38:26', '[{\"browserId\":\"570f7ebb8ad6f035d3e869d83497f65e\",\"articleTitle\":\"Mybatis\",\"likeflag\":0,\"loveflag\":0,\"smileflag\":0}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (128, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 15:38:43', '[\"Mybatis\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (129, '获取用户的点赞相关信息和文章信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetUserLike', '2024-07-25 15:38:43', '[{\"browserId\":\"570f7ebb8ad6f035d3e869d83497f65e\",\"articleTitle\":\"Mybatis\",\"likeflag\":0,\"loveflag\":0,\"smileflag\":0}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (130, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 15:38:45', '[\"Mybatis\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (131, '获取用户的点赞相关信息和文章信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetUserLike', '2024-07-25 15:38:46', '[{\"browserId\":\"570f7ebb8ad6f035d3e869d83497f65e\",\"articleTitle\":\"Mybatis\",\"likeflag\":0,\"loveflag\":0,\"smileflag\":0}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (132, '根据分类名称和每页大小以及第几页获取文章信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticlesByCategoryNameAndPage', '2024-07-25 15:38:47', '[\"Spring\",null,null]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (133, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 15:38:50', '[\"Mybatis\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (134, '获取用户的点赞相关信息和文章信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetUserLike', '2024-07-25 15:38:50', '[{\"browserId\":\"570f7ebb8ad6f035d3e869d83497f65e\",\"articleTitle\":\"Mybatis\",\"likeflag\":0,\"loveflag\":0,\"smileflag\":0}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (135, '根据分类名称和每页大小以及第几页获取文章信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticlesByCategoryNameAndPage', '2024-07-25 15:39:21', '[null,null,null]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (136, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 15:45:36', '[\"Redis集群相关\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (137, '获取用户的点赞相关信息和文章信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetUserLike', '2024-07-25 15:45:36', '[{\"browserId\":\"570f7ebb8ad6f035d3e869d83497f65e\",\"articleTitle\":\"Redis集群相关\",\"likeflag\":0,\"loveflag\":0,\"smileflag\":0}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (138, '根据分类名称和每页大小以及第几页获取文章信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticlesByCategoryNameAndPage', '2024-07-25 15:45:38', '[\"Redis\",null,null]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (139, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 15:46:01', '[\"Redis集群相关\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (140, '获取用户的点赞相关信息和文章信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetUserLike', '2024-07-25 15:46:01', '[{\"browserId\":\"570f7ebb8ad6f035d3e869d83497f65e\",\"articleTitle\":\"Redis集群相关\",\"likeflag\":0,\"loveflag\":0,\"smileflag\":0}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (141, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 15:46:36', '[\"Redis集群相关\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (142, '获取用户的点赞相关信息和文章信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetUserLike', '2024-07-25 15:46:36', '[{\"browserId\":\"570f7ebb8ad6f035d3e869d83497f65e\",\"articleTitle\":\"Redis集群相关\",\"likeflag\":0,\"loveflag\":0,\"smileflag\":0}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (143, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 15:46:43', '[\"Redis集群相关\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (144, '获取用户的点赞相关信息和文章信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetUserLike', '2024-07-25 15:46:43', '[{\"browserId\":\"570f7ebb8ad6f035d3e869d83497f65e\",\"articleTitle\":\"Redis集群相关\",\"likeflag\":0,\"loveflag\":0,\"smileflag\":0}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (145, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 15:47:02', '[\"Redis集群相关\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (146, '获取用户的点赞相关信息和文章信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetUserLike', '2024-07-25 15:47:02', '[{\"browserId\":\"570f7ebb8ad6f035d3e869d83497f65e\",\"articleTitle\":\"Redis集群相关\",\"likeflag\":0,\"loveflag\":0,\"smileflag\":0}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (147, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 15:47:51', '[\"Redis集群相关\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (148, '获取用户的点赞相关信息和文章信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetUserLike', '2024-07-25 15:47:51', '[{\"browserId\":\"570f7ebb8ad6f035d3e869d83497f65e\",\"articleTitle\":\"Redis集群相关\",\"likeflag\":0,\"loveflag\":0,\"smileflag\":0}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (149, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 15:47:58', '[\"Redis集群相关\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (150, '获取用户的点赞相关信息和文章信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetUserLike', '2024-07-25 15:47:58', '[{\"browserId\":\"570f7ebb8ad6f035d3e869d83497f65e\",\"articleTitle\":\"Redis集群相关\",\"likeflag\":0,\"loveflag\":0,\"smileflag\":0}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (151, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 15:47:58', '[\"Redis集群相关\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (152, '获取用户的点赞相关信息和文章信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetUserLike', '2024-07-25 15:47:58', '[{\"browserId\":\"570f7ebb8ad6f035d3e869d83497f65e\",\"articleTitle\":\"Redis集群相关\",\"likeflag\":0,\"loveflag\":0,\"smileflag\":0}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (153, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 15:48:02', '[\"Redis集群相关\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (154, '获取用户的点赞相关信息和文章信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetUserLike', '2024-07-25 15:48:02', '[{\"browserId\":\"570f7ebb8ad6f035d3e869d83497f65e\",\"articleTitle\":\"Redis集群相关\",\"likeflag\":0,\"loveflag\":0,\"smileflag\":0}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (155, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 15:49:08', '[\"Redis集群相关\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (156, '获取用户的点赞相关信息和文章信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetUserLike', '2024-07-25 15:49:08', '[{\"browserId\":\"570f7ebb8ad6f035d3e869d83497f65e\",\"articleTitle\":\"Redis集群相关\",\"likeflag\":0,\"loveflag\":0,\"smileflag\":0}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (157, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 15:49:10', '[\"Redis集群相关\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (158, '获取用户的点赞相关信息和文章信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetUserLike', '2024-07-25 15:49:10', '[{\"browserId\":\"570f7ebb8ad6f035d3e869d83497f65e\",\"articleTitle\":\"Redis集群相关\",\"likeflag\":0,\"loveflag\":0,\"smileflag\":0}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (159, '获取文章的点赞相关信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleLike', '2024-07-25 15:49:13', '[\"Redis集群相关\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (160, '获取用户的点赞相关信息和文章信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetUserLike', '2024-07-25 15:49:14', '[{\"browserId\":\"570f7ebb8ad6f035d3e869d83497f65e\",\"articleTitle\":\"Redis集群相关\",\"likeflag\":0,\"loveflag\":0,\"smileflag\":0}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (161, '更新文章和用户点赞信息', 'UPDATE', 'com.mblog.controller.user.ArticleControllerupdateLike', '2024-07-25 16:09:21', '[{\"browserId\":\"570f7ebb8ad6f035d3e869d83497f65e\",\"articleTitle\":\"Redis集群相关\",\"likeflag\":1,\"loveflag\":0,\"smileflag\":0}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (162, '根据搜索内容获取文章信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticlesBySearch', '2024-07-25 16:12:16', '[\"redis\",5,1]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (163, '根据title获取文章信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleByTitle', '2024-07-26 16:05:59', '[\"计算机网络面试题\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (164, '新增文章', 'INSERT', 'com.mblog.controller.admin.ArticleControllersave', '2024-07-26 17:04:11', '[{\"title\":\"测试\",\"text\":\"# 测试\",\"intro\":\"测试\",\"categoryName\":\"其他\",\"filePath\":\"C:/Code/JavaProject/blog-vue/public/mymd\",\"originTitle\":null}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (165, '新增文章', 'INSERT', 'com.mblog.controller.admin.ArticleControllersave', '2024-07-26 17:10:06', '[{\"title\":\"测试\",\"text\":\"# 测试\",\"intro\":\"测试\",\"categoryName\":\"其他\",\"filePath\":\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\",\"originTitle\":null}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (166, '根据id删除文章', 'DELETE', 'com.mblog.controller.admin.ArticleControllerdeleteById', '2024-07-26 17:12:23', '[187,\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (167, '新增文章', 'INSERT', 'com.mblog.controller.admin.ArticleControllersave', '2024-07-26 17:12:39', '[{\"title\":\"ddd\",\"text\":\"# ddd\",\"intro\":\"ddd\",\"categoryName\":\"其他\",\"filePath\":\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\",\"originTitle\":null}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (168, '根据title获取文章信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleByTitle', '2024-07-26 17:12:39', '[\"ddd\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (169, '新增文章', 'INSERT', 'com.mblog.controller.admin.ArticleControllersave', '2024-07-29 14:20:52', '[{\"title\":\"ddd\",\"text\":\"# dddd\",\"intro\":\"ddd\",\"categoryName\":\"个人总结\",\"filePath\":\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\",\"originTitle\":null}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (170, '根据id删除文章', 'DELETE', 'com.mblog.controller.admin.ArticleControllerdeleteById', '2024-07-29 14:21:37', '[189,\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (171, '新增文章', 'INSERT', 'com.mblog.controller.admin.ArticleControllersave', '2024-07-29 14:21:51', '[{\"title\":\"ddd\",\"text\":\"# dddd\",\"intro\":\"dddd\",\"categoryName\":\"个人总结\",\"filePath\":\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\",\"originTitle\":null}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (172, '根据title获取文章信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleByTitle', '2024-07-29 14:21:51', '[\"ddd\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (173, '根据id删除文章', 'DELETE', 'com.mblog.controller.admin.ArticleControllerdeleteById', '2024-07-29 14:22:32', '[190,\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (174, '新增文章', 'INSERT', 'com.mblog.controller.admin.ArticleControllersave', '2024-07-29 14:23:43', '[{\"title\":\"ddd\",\"text\":\"# dddd\\nddddd\",\"intro\":\"ddddddd\",\"categoryName\":\"日常\",\"filePath\":\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\",\"originTitle\":null}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (175, '根据id删除文章', 'DELETE', 'com.mblog.controller.admin.ArticleControllerdeleteById', '2024-07-29 14:24:59', '[191,\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (176, '根据id更新文章', 'UPDATE', 'com.mblog.controller.admin.ArticleControllerupdate', '2024-07-29 14:25:15', '[{\"title\":\"ddd\",\"text\":null,\"intro\":\"ddd\",\"categoryName\":\"个人总结\",\"filePath\":\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\",\"originTitle\":null}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (177, '根据id删除文章', 'DELETE', 'com.mblog.controller.admin.ArticleControllerdeleteById', '2024-07-29 14:25:24', '[188,\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (178, '新增文章', 'INSERT', 'com.mblog.controller.admin.ArticleControllersave', '2024-07-29 14:26:34', '[{\"title\":\"test\",\"text\":\"# test\",\"intro\":\"test\",\"categoryName\":\"其他\",\"filePath\":\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\",\"originTitle\":null}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (179, '根据title获取文章信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleByTitle', '2024-07-29 14:26:35', '[\"test\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (180, '根据id更新文章', 'UPDATE', 'com.mblog.controller.admin.ArticleControllerupdate', '2024-07-29 14:26:49', '[{\"title\":\"test\",\"text\":null,\"intro\":\"test\",\"categoryName\":\"论文相关\",\"filePath\":\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\",\"originTitle\":null}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (181, '根据id删除文章', 'DELETE', 'com.mblog.controller.admin.ArticleControllerdeleteById', '2024-07-29 14:28:29', '[192,\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (182, '新增文章', 'INSERT', 'com.mblog.controller.admin.ArticleControllersave', '2024-07-29 14:29:38', '[{\"title\":\"test\",\"text\":\"# test\",\"intro\":\"test\",\"categoryName\":\"其他\",\"filePath\":\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\",\"originTitle\":null}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (183, '根据id删除文章', 'DELETE', 'com.mblog.controller.admin.ArticleControllerdeleteById', '2024-07-29 14:30:04', '[193,\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (184, '新增文章', 'INSERT', 'com.mblog.controller.admin.ArticleControllersave', '2024-07-29 14:30:23', '[{\"title\":\"test\",\"text\":\"# test\",\"intro\":\"test\",\"categoryName\":\"日常\",\"filePath\":\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\",\"originTitle\":null}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (185, '根据title获取文章信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleByTitle', '2024-07-29 14:30:24', '[\"test\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (186, '根据id更新文章', 'UPDATE', 'com.mblog.controller.admin.ArticleControllerupdate', '2024-07-29 14:30:36', '[{\"title\":\"test\",\"text\":null,\"intro\":\"test\",\"categoryName\":\"其他\",\"filePath\":\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\",\"originTitle\":null}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (187, '根据id更新文章', 'UPDATE', 'com.mblog.controller.admin.ArticleControllerupdate', '2024-07-29 14:33:00', '[{\"title\":\"test\",\"text\":null,\"intro\":\"test\",\"categoryName\":\"高性能\",\"filePath\":\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\",\"originTitle\":null}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (188, '根据id更新文章', 'UPDATE', 'com.mblog.controller.admin.ArticleControllerupdate', '2024-07-29 14:34:52', '[{\"title\":\"test\",\"text\":null,\"intro\":\"test\",\"categoryName\":\"实战项目\",\"filePath\":\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\",\"originTitle\":null}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (189, '根据id更新文章', 'UPDATE', 'com.mblog.controller.admin.ArticleControllerupdate', '2024-07-29 14:38:59', '[{\"title\":\"test\",\"text\":null,\"intro\":\"test\",\"categoryName\":\"SpMV\",\"filePath\":\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\",\"originTitle\":\"test\"}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (190, '根据id更新文章', 'UPDATE', 'com.mblog.controller.admin.ArticleControllerupdate', '2024-07-29 14:39:20', '[{\"title\":\"test\",\"text\":null,\"intro\":\"test\",\"categoryName\":\"苍穹外卖\",\"filePath\":\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\",\"originTitle\":\"test\"}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (191, '根据id更新文章', 'UPDATE', 'com.mblog.controller.admin.ArticleControllerupdate', '2024-07-29 14:39:35', '[{\"title\":\"test\",\"text\":null,\"intro\":\"test\",\"categoryName\":\"相关技术\",\"filePath\":\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\",\"originTitle\":\"test\"}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (192, '根据id更新文章', 'UPDATE', 'com.mblog.controller.admin.ArticleControllerupdate', '2024-07-29 14:40:28', '[{\"title\":\"test\",\"text\":null,\"intro\":\"test\",\"categoryName\":\"微服务相关\",\"filePath\":\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\",\"originTitle\":\"test\"}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (193, '根据title获取文章信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleByTitle', '2024-07-29 14:40:37', '[\"test\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (194, '新增文章', 'INSERT', 'com.mblog.controller.admin.ArticleControllersave', '2024-07-29 14:40:47', '[{\"title\":\"test\",\"text\":\"# dddd\",\"intro\":\"test\",\"categoryName\":\"个人总结\",\"filePath\":\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\",\"originTitle\":\"test\"}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (195, '根据title获取文章信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleByTitle', '2024-07-29 14:40:48', '[\"test\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (196, '根据title获取文章信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleByTitle', '2024-07-29 14:40:50', '[\"test\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (197, '根据title获取文章信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleByTitle', '2024-07-29 14:41:09', '[\"test\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (198, '新增文章', 'INSERT', 'com.mblog.controller.admin.ArticleControllersave', '2024-07-29 14:41:20', '[{\"title\":\"test\",\"text\":\"# test\",\"intro\":\"test\",\"categoryName\":\"其他\",\"filePath\":\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\",\"originTitle\":\"test\"}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (199, '根据title获取文章信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleByTitle', '2024-07-29 14:41:20', '[\"test\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (200, '根据id删除文章', 'DELETE', 'com.mblog.controller.admin.ArticleControllerdeleteById', '2024-07-29 14:42:23', '[194,\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (201, '新增文章', 'INSERT', 'com.mblog.controller.admin.ArticleControllersave', '2024-07-29 14:43:28', '[{\"title\":\"test\",\"text\":\"# test\",\"intro\":\"test\",\"categoryName\":\"论文相关\",\"filePath\":\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\",\"originTitle\":null}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (202, '新增文章', 'INSERT', 'com.mblog.controller.admin.ArticleControllersave', '2024-07-29 14:43:43', '[{\"title\":\"test\",\"text\":\"# test\",\"intro\":\"test\",\"categoryName\":\"日常\",\"filePath\":\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\",\"originTitle\":null}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (203, '根据id删除文章', 'DELETE', 'com.mblog.controller.admin.ArticleControllerdeleteById', '2024-07-29 14:44:07', '[196,\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (204, '根据id删除文章', 'DELETE', 'com.mblog.controller.admin.ArticleControllerdeleteById', '2024-07-29 14:44:10', '[195,\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (205, '新增文章', 'INSERT', 'com.mblog.controller.admin.ArticleControllersave', '2024-07-29 14:44:31', '[{\"title\":\"test\",\"text\":\"# test\",\"intro\":\"test\",\"categoryName\":\"高性能\",\"filePath\":\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\",\"originTitle\":null}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (206, '根据title获取文章信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleByTitle', '2024-07-29 14:44:31', '[\"test\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (207, '新增文章', 'INSERT', 'com.mblog.controller.admin.ArticleControllersave', '2024-07-29 14:45:04', '[{\"title\":\"tes\",\"text\":\"# test\",\"intro\":\"test\",\"categoryName\":\"竞赛\",\"filePath\":\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\",\"originTitle\":null}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (208, '根据title获取文章信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleByTitle', '2024-07-29 14:45:04', '[\"tes\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (209, '根据id删除文章', 'DELETE', 'com.mblog.controller.admin.ArticleControllerdeleteById', '2024-07-29 14:48:03', '[198,\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (210, '新增文章', 'INSERT', 'com.mblog.controller.admin.ArticleControllersave', '2024-07-29 14:48:19', '[{\"title\":\"test\",\"text\":\"ttttt\",\"intro\":\"test\",\"categoryName\":\"JAVA多线程\",\"filePath\":\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\",\"originTitle\":null}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (211, '根据title获取文章信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleByTitle', '2024-07-29 15:00:09', '[\"test\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (212, '新增文章', 'INSERT', 'com.mblog.controller.admin.ArticleControllersave', '2024-07-29 15:00:16', '[{\"title\":\"test\",\"text\":\"ddddd\",\"intro\":\"ddddd\",\"categoryName\":\"GateWay\",\"filePath\":\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\",\"originTitle\":\"test\"}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (213, '新增文章', 'INSERT', 'com.mblog.controller.admin.ArticleControllersave', '2024-07-29 15:37:09', '[{\"title\":\"test2\",\"text\":\"test2\",\"intro\":\"test2\",\"categoryName\":\"IDEA\",\"filePath\":\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\",\"originTitle\":null}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (214, '根据title获取文章信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleByTitle', '2024-07-29 15:37:09', '[\"test2\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (215, '根据title获取文章信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleByTitle', '2024-07-29 15:37:13', '[\"test\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (216, '根据id更新文章', 'UPDATE', 'com.mblog.controller.admin.ArticleControllerupdate', '2024-07-29 15:37:19', '[{\"title\":\"test2\",\"text\":\"ddddd\",\"intro\":\"ddddd\",\"categoryName\":\"GateWay\",\"filePath\":\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\",\"originTitle\":\"test\"}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (217, '根据title获取文章信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleByTitle', '2024-07-29 15:37:19', '[\"test2\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (218, '根据title获取文章信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleByTitle', '2024-07-29 15:37:59', '[\"test\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (219, '根据title获取文章信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleByTitle', '2024-07-29 15:38:12', '[\"test\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (220, '根据id更新文章', 'UPDATE', 'com.mblog.controller.admin.ArticleControllerupdate', '2024-07-29 15:38:17', '[{\"title\":\"test2\",\"text\":\"ddddd\",\"intro\":\"test2\",\"categoryName\":\"IDEA\",\"filePath\":\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\",\"originTitle\":\"test\"}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (221, '根据title获取文章信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleByTitle', '2024-07-29 15:38:17', '[\"test2\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (222, '根据title获取文章信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleByTitle', '2024-07-29 15:40:50', '[\"test2\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (223, '根据title获取文章信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleByTitle', '2024-07-29 15:41:00', '[\"test2\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (224, '根据title获取文章信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleByTitle', '2024-07-29 15:41:05', '[\"test\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (225, '新增文章', 'INSERT', 'com.mblog.controller.admin.ArticleControllersave', '2024-07-29 15:41:09', '[{\"title\":\"test2\",\"text\":\"ddddd\",\"intro\":\"test2\",\"categoryName\":\"IDEA\",\"filePath\":\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\",\"originTitle\":\"test\"}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (226, '新增文章', 'INSERT', 'com.mblog.controller.admin.ArticleControllersave', '2024-07-29 15:41:11', '[{\"title\":\"test2\",\"text\":\"ddddd\",\"intro\":\"test2\",\"categoryName\":\"IDEA\",\"filePath\":\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\",\"originTitle\":\"test\"}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (227, '新增文章', 'INSERT', 'com.mblog.controller.admin.ArticleControllersave', '2024-07-29 15:41:12', '[{\"title\":\"test2\",\"text\":\"ddddd\",\"intro\":\"test2\",\"categoryName\":\"IDEA\",\"filePath\":\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\",\"originTitle\":\"test\"}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (228, '新增文章', 'INSERT', 'com.mblog.controller.admin.ArticleControllersave', '2024-07-29 15:41:16', '[{\"title\":\"test2\",\"text\":\"ddddd\",\"intro\":\"test2\",\"categoryName\":\"IDEA\",\"filePath\":\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\",\"originTitle\":\"test\"}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (229, '新增文章', 'INSERT', 'com.mblog.controller.admin.ArticleControllersave', '2024-07-29 15:41:17', '[{\"title\":\"test2\",\"text\":\"ddddd\",\"intro\":\"test2\",\"categoryName\":\"IDEA\",\"filePath\":\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\",\"originTitle\":\"test\"}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (230, '新增文章', 'INSERT', 'com.mblog.controller.admin.ArticleControllersave', '2024-07-29 15:41:17', '[{\"title\":\"test2\",\"text\":\"ddddd\",\"intro\":\"test2\",\"categoryName\":\"IDEA\",\"filePath\":\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\",\"originTitle\":\"test\"}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (231, '新增文章', 'INSERT', 'com.mblog.controller.admin.ArticleControllersave', '2024-07-29 15:41:17', '[{\"title\":\"test2\",\"text\":\"ddddd\",\"intro\":\"test2\",\"categoryName\":\"IDEA\",\"filePath\":\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\",\"originTitle\":\"test\"}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (232, '新增文章', 'INSERT', 'com.mblog.controller.admin.ArticleControllersave', '2024-07-29 15:41:18', '[{\"title\":\"test2\",\"text\":\"ddddd\",\"intro\":\"test2\",\"categoryName\":\"IDEA\",\"filePath\":\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\",\"originTitle\":\"test\"}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (233, '新增文章', 'INSERT', 'com.mblog.controller.admin.ArticleControllersave', '2024-07-29 15:41:18', '[{\"title\":\"test2\",\"text\":\"ddddd\",\"intro\":\"test2\",\"categoryName\":\"IDEA\",\"filePath\":\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\",\"originTitle\":\"test\"}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (234, '新增文章', 'INSERT', 'com.mblog.controller.admin.ArticleControllersave', '2024-07-29 15:41:18', '[{\"title\":\"test2\",\"text\":\"ddddd\",\"intro\":\"test2\",\"categoryName\":\"IDEA\",\"filePath\":\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\",\"originTitle\":\"test\"}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (235, '新增文章', 'INSERT', 'com.mblog.controller.admin.ArticleControllersave', '2024-07-29 15:41:18', '[{\"title\":\"test2\",\"text\":\"ddddd\",\"intro\":\"test2\",\"categoryName\":\"IDEA\",\"filePath\":\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\",\"originTitle\":\"test\"}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (236, '根据title获取文章信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleByTitle', '2024-07-29 15:41:35', '[\"test\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (237, '新增文章', 'INSERT', 'com.mblog.controller.admin.ArticleControllersave', '2024-07-29 15:41:43', '[{\"title\":\"test2\",\"text\":\"ddddd\",\"intro\":\"test2\",\"categoryName\":\"IDEA\",\"filePath\":\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\",\"originTitle\":\"test\"}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (238, '根据title获取文章信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleByTitle', '2024-07-29 15:42:42', '[\"test\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (239, '新增文章', 'INSERT', 'com.mblog.controller.admin.ArticleControllersave', '2024-07-29 15:43:06', '[{\"title\":\"test2\",\"text\":\"ddddd\",\"intro\":\"test2\",\"categoryName\":\"IDEA\",\"filePath\":\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\",\"originTitle\":\"test\"}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (240, '根据title获取文章信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleByTitle', '2024-07-29 15:44:35', '[\"test\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (241, '新增文章', 'INSERT', 'com.mblog.controller.admin.ArticleControllersave', '2024-07-29 15:44:54', '[{\"title\":\"test2\",\"text\":\"ddddd\",\"intro\":\"test2\",\"categoryName\":\"IDEA\",\"filePath\":\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\",\"originTitle\":\"test\"}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (242, '新增文章', 'INSERT', 'com.mblog.controller.admin.ArticleControllersave', '2024-07-29 15:44:54', '[{\"title\":\"test2\",\"text\":\"ddddd\",\"intro\":\"test2\",\"categoryName\":\"IDEA\",\"filePath\":\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\",\"originTitle\":\"test\"}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (243, '根据title获取文章信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleByTitle', '2024-07-29 15:45:17', '[\"test\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (244, '新增文章', 'INSERT', 'com.mblog.controller.admin.ArticleControllersave', '2024-07-29 15:45:20', '[{\"title\":\"test2\",\"text\":\"ddddd\",\"intro\":\"test2\",\"categoryName\":\"IDEA\",\"filePath\":\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\",\"originTitle\":\"test\"}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (245, '新增文章', 'INSERT', 'com.mblog.controller.admin.ArticleControllersave', '2024-07-29 15:45:25', '[{\"title\":\"test2\",\"text\":\"ddddd\",\"intro\":\"test2\",\"categoryName\":\"IDEA\",\"filePath\":\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\",\"originTitle\":\"test\"}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (246, '根据title获取文章信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleByTitle', '2024-07-29 15:46:00', '[\"test\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (247, '新增文章', 'INSERT', 'com.mblog.controller.admin.ArticleControllersave', '2024-07-29 15:46:04', '[{\"title\":\"test3\",\"text\":\"ddddd\",\"intro\":\"test2\",\"categoryName\":\"IDEA\",\"filePath\":\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\",\"originTitle\":\"test\"}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (248, '根据title获取文章信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleByTitle', '2024-07-29 15:46:04', '[\"test3\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (249, '根据title获取文章信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleByTitle', '2024-07-29 15:50:48', '[\"test3\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (250, '新增文章', 'INSERT', 'com.mblog.controller.admin.ArticleControllersave', '2024-07-29 15:50:52', '[{\"title\":\"test\",\"text\":\"ddddd\",\"intro\":\"test2\",\"categoryName\":\"CUDA\",\"filePath\":\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\",\"originTitle\":\"test3\"}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (251, '根据title获取文章信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleByTitle', '2024-07-29 15:50:53', '[\"test\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (252, '根据title获取文章信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleByTitle', '2024-07-29 15:51:14', '[\"test\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (253, '新增文章', 'INSERT', 'com.mblog.controller.admin.ArticleControllersave', '2024-07-29 15:51:16', '[{\"title\":\"test2\",\"text\":\"ddddd\",\"intro\":\"test2\",\"categoryName\":\"CUDA\",\"filePath\":\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\",\"originTitle\":\"test\"}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (254, '新增文章', 'INSERT', 'com.mblog.controller.admin.ArticleControllersave', '2024-07-29 15:52:11', '[{\"title\":\"test2\",\"text\":\"rrrrrrrr\",\"intro\":\"ttttt\",\"categoryName\":\"日常\",\"filePath\":\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\",\"originTitle\":\"test2\"}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (255, '根据id删除文章', 'DELETE', 'com.mblog.controller.admin.ArticleControllerdeleteById', '2024-07-29 15:52:37', '[201,\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (256, '根据id删除文章', 'DELETE', 'com.mblog.controller.admin.ArticleControllerdeleteById', '2024-07-29 15:52:39', '[199,\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (257, '新增文章', 'INSERT', 'com.mblog.controller.admin.ArticleControllersave', '2024-07-29 15:52:55', '[{\"title\":\"ddd\",\"text\":\"# dddddd\",\"intro\":\"ddd\",\"categoryName\":\"科研\",\"filePath\":\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\",\"originTitle\":null}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (258, '根据title获取文章信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleByTitle', '2024-07-29 15:52:55', '[\"ddd\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (259, '根据id更新文章', 'UPDATE', 'com.mblog.controller.admin.ArticleControllerupdate', '2024-07-29 15:53:01', '[{\"title\":\"ddd\",\"text\":null,\"intro\":\"ddd\",\"categoryName\":\"OpenFeign\",\"filePath\":\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\",\"originTitle\":\"ddd\"}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (260, '根据title获取文章信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleByTitle', '2024-07-29 15:53:07', '[\"ddd\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (261, '新增文章', 'INSERT', 'com.mblog.controller.admin.ArticleControllersave', '2024-07-29 15:53:09', '[{\"title\":\"ddd2\",\"text\":\"# dddddd\",\"intro\":\"ddd\",\"categoryName\":\"OpenFeign\",\"filePath\":\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\",\"originTitle\":\"ddd\"}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (262, '根据title获取文章信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleByTitle', '2024-07-29 15:53:10', '[\"ddd2\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (263, '根据title获取文章信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleByTitle', '2024-07-29 15:53:12', '[\"ddd2\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (264, '新增文章', 'INSERT', 'com.mblog.controller.admin.ArticleControllersave', '2024-07-29 15:53:17', '[{\"title\":\"ddd\",\"text\":\"# dddddd\",\"intro\":\"ddd\",\"categoryName\":\"其他\",\"filePath\":\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\",\"originTitle\":\"ddd2\"}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (265, '根据title获取文章信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticleByTitle', '2024-07-29 15:53:18', '[\"ddd\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (266, '新增文章', 'INSERT', 'com.mblog.controller.admin.ArticleControllersave', '2024-07-29 15:53:29', '[{\"title\":\"ddd\",\"text\":\"ddd2\",\"intro\":\"dddd2\",\"categoryName\":\"科研\",\"filePath\":\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\",\"originTitle\":\"ddd\"}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (267, '根据id删除文章', 'DELETE', 'com.mblog.controller.admin.ArticleControllerdeleteById', '2024-07-29 15:53:34', '[202,\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (268, '根据搜索内容获取文章信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticlesBySearch', '2024-07-31 15:18:53', '[\"redis\",5,5]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (269, '根据搜索内容获取文章信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticlesBySearch', '2024-07-31 15:19:14', '[\"redis\",5,1]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (270, '根据搜索内容获取文章信息', 'LIST', 'com.mblog.controller.user.ArticleControllergetArticlesBySearch', '2024-07-31 15:19:24', '[\"java\",5,1]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (271, '新增文章', 'INSERT', 'com.mblog.controller.admin.ArticleControllersave', '2024-08-01 15:47:22', '[{\"title\":\"dddd\",\"text\":\"# tedst\\ntrttt\",\"intro\":\"dddd\",\"categoryName\":\"源码\",\"filePath\":\"/home/tjx/blog/vue/dist/mymd\",\"originTitle\":null}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (272, '新增文章', 'INSERT', 'com.mblog.controller.admin.ArticleControllersave', '2024-08-01 15:48:17', '[{\"title\":\"ddd\",\"text\":\"# ddd\",\"intro\":\"ddd\",\"categoryName\":\"源码\",\"filePath\":\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\",\"originTitle\":null}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (273, '根据id删除文章', 'DELETE', 'com.mblog.controller.admin.ArticleControllerdeleteById', '2024-08-01 15:48:25', '[203,\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (274, '新增文章', 'INSERT', 'com.mblog.controller.admin.ArticleControllersave', '2024-08-01 15:58:20', '[{\"title\":\"ddd\",\"text\":\"# ttt\",\"intro\":\"ddd\",\"categoryName\":\"论文\",\"filePath\":\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\",\"originTitle\":null}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (275, '根据id删除文章', 'DELETE', 'com.mblog.controller.admin.ArticleControllerdeleteById', '2024-08-01 15:58:31', '[204,\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (276, '新增文章', 'INSERT', 'com.mblog.controller.admin.ArticleControllersave', '2024-08-01 16:00:38', '[{\"title\":\"ddd\",\"text\":\"# ddd\",\"intro\":\"ddd\",\"categoryName\":\"源码\",\"filePath\":\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\",\"originTitle\":null}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (277, '根据id删除文章', 'DELETE', 'com.mblog.controller.admin.ArticleControllerdeleteById', '2024-08-01 16:01:16', '[205,\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (278, '新增文章', 'INSERT', 'com.mblog.controller.admin.ArticleControllersave', '2024-08-01 16:04:15', '[{\"title\":\"ddd\",\"text\":\"dddd\",\"intro\":\"ddd\",\"categoryName\":\"源码\",\"filePath\":\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\",\"originTitle\":null}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (279, '根据id删除文章', 'DELETE', 'com.mblog.controller.admin.ArticleControllerdeleteById', '2024-08-01 16:04:25', '[206,\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (280, '新增文章', 'INSERT', 'com.mblog.controller.admin.ArticleControllersave', '2024-08-01 16:05:11', '[{\"title\":\"ddd\",\"text\":\"dddd\",\"intro\":\"ddd\",\"categoryName\":\"源码\",\"filePath\":\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\",\"originTitle\":null}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (281, '根据id删除文章', 'DELETE', 'com.mblog.controller.admin.ArticleControllerdeleteById', '2024-08-01 16:05:20', '[207,\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (282, '新增文章', 'INSERT', 'com.mblog.controller.admin.ArticleControllersave', '2024-08-01 16:06:11', '[{\"title\":\"dd\",\"text\":\"ddd\",\"intro\":\"dd\",\"categoryName\":\"源码\",\"filePath\":\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\",\"originTitle\":null}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (283, '根据id删除文章', 'DELETE', 'com.mblog.controller.admin.ArticleControllerdeleteById', '2024-08-01 16:06:45', '[208,\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (284, '新增文章', 'INSERT', 'com.mblog.controller.admin.ArticleControllersave', '2024-08-01 16:08:17', '[{\"title\":\"ddd\",\"text\":\"dd\",\"intro\":\"ddd\",\"categoryName\":\"源码\",\"filePath\":\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\",\"originTitle\":\"ddd\"}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (285, '新增文章', 'INSERT', 'com.mblog.controller.admin.ArticleControllersave', '2024-08-01 16:08:17', '[{\"title\":\"ddd\",\"text\":\"dd\",\"intro\":\"ddd\",\"categoryName\":\"源码\",\"filePath\":\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\",\"originTitle\":null}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (286, '根据id删除文章', 'DELETE', 'com.mblog.controller.admin.ArticleControllerdeleteById', '2024-08-01 16:09:16', '[209,\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (287, '新增文章', 'INSERT', 'com.mblog.controller.admin.ArticleControllersave', '2024-08-01 16:12:02', '[{\"title\":\"dddd\",\"text\":\"dddddddd\",\"intro\":\"dddddd\",\"categoryName\":\"论文\",\"filePath\":\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\",\"originTitle\":null}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (288, '根据id删除文章', 'DELETE', 'com.mblog.controller.admin.ArticleControllerdeleteById', '2024-08-01 16:12:18', '[210,\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (289, '新增文章', 'INSERT', 'com.mblog.controller.admin.ArticleControllersave', '2024-08-01 16:15:22', '[{\"title\":\"dddd\",\"text\":\"dddddddd\",\"intro\":\"dddd\",\"categoryName\":\"论文\",\"filePath\":\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\",\"originTitle\":null}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (290, '根据id删除文章', 'DELETE', 'com.mblog.controller.admin.ArticleControllerdeleteById', '2024-08-01 16:16:00', '[211,\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (291, '新增文章', 'INSERT', 'com.mblog.controller.admin.ArticleControllersave', '2024-08-01 16:16:52', '[{\"title\":\"dddddd\",\"text\":\"dddddddd\",\"intro\":\"ddd\",\"categoryName\":\"论文\",\"filePath\":\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\",\"originTitle\":null}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (292, '新增文章', 'INSERT', 'com.mblog.controller.admin.ArticleControllersave', '2024-08-01 16:18:00', '[{\"title\":\"dddddddd\",\"text\":\"dddddddddd\",\"intro\":\"dddddddd\",\"categoryName\":\"源码\",\"filePath\":\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\",\"originTitle\":null}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (293, '根据id更新文章', 'UPDATE', 'com.mblog.controller.admin.ArticleControllerupdate', '2024-08-01 16:20:35', '[{\"title\":\"dddddddd\",\"text\":null,\"intro\":\"dddddddd\",\"categoryName\":\"苍穹外卖\",\"filePath\":\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\",\"originTitle\":\"dddddddd\"}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (294, '根据id更新文章', 'UPDATE', 'com.mblog.controller.admin.ArticleControllerupdate', '2024-08-01 16:22:07', '[{\"title\":\"dddddddd\",\"text\":null,\"intro\":\"dddddddd\",\"categoryName\":\"苍穹外卖\",\"filePath\":\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\",\"originTitle\":\"dddddddd\"}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (295, '根据id更新文章', 'UPDATE', 'com.mblog.controller.admin.ArticleControllerupdate', '2024-08-01 16:24:52', '[{\"title\":\"dddddddd\",\"text\":null,\"intro\":\"dddddddd\",\"categoryName\":\"苍穹外卖\",\"filePath\":\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\",\"originTitle\":\"dddddddd\"}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (296, '新增分类', 'INSERT', 'com.mblog.controller.admin.CategoryControllersave', '2024-08-01 16:32:44', '[{\"id\":null,\"name\":\"ddddd\",\"parentId\":1,\"level\":1}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (297, '根据id删除分类', 'DELETE', 'com.mblog.controller.admin.CategoryControllerdeleteByID', '2024-08-01 16:34:02', '[45]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (298, '新增文章', 'INSERT', 'com.mblog.controller.admin.ArticleControllersave', '2024-08-06 16:14:10', '[{\"title\":\"ttt\",\"text\":\"ttt\",\"intro\":\"ttt\",\"categoryName\":\"微服务相关\",\"filePath\":\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\",\"originTitle\":null}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (299, '根据id更新文章', 'UPDATE', 'com.mblog.controller.admin.ArticleControllerupdate', '2024-08-06 16:21:28', '[{\"title\":\"dddddddd\",\"text\":null,\"intro\":\"dddddddd\",\"categoryName\":\"微服务相关\",\"filePath\":\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\",\"originTitle\":\"dddddddd\"}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (300, '根据id删除文章', 'DELETE', 'com.mblog.controller.admin.ArticleControllerdeleteById', '2024-08-06 16:22:09', '[213,\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (301, '新增文章', 'INSERT', 'com.mblog.controller.admin.ArticleControllersave', '2024-08-06 16:22:28', '[{\"title\":\"dddd\",\"text\":\"ddd\",\"intro\":\"dd\",\"categoryName\":\"微服务相关\",\"filePath\":\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\",\"originTitle\":null}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (302, '根据id修改分类信息', 'UPDATE', 'com.mblog.controller.admin.CategoryControllerupdate', '2024-08-06 16:51:20', '[{\"id\":9,\"name\":\"Spring Cloud\",\"parentId\":2,\"level\":0,\"number\":10}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (303, '根据id修改分类信息', 'UPDATE', 'com.mblog.controller.admin.CategoryControllerupdate', '2024-08-06 16:55:36', '[{\"id\":9,\"name\":\"Spring Cloud\",\"parentId\":2,\"level\":1,\"number\":10}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (304, '根据id修改分类信息', 'UPDATE', 'com.mblog.controller.admin.CategoryControllerupdate', '2024-08-06 16:56:25', '[{\"id\":9,\"name\":\"Spring Cloud\",\"parentId\":5,\"level\":2,\"number\":10}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (305, '根据id修改分类信息', 'UPDATE', 'com.mblog.controller.admin.CategoryControllerupdate', '2024-08-06 16:57:06', '[{\"id\":9,\"name\":\"Spring Cloud\",\"parentId\":1,\"level\":1,\"number\":10}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (306, '根据id修改分类信息', 'UPDATE', 'com.mblog.controller.admin.CategoryControllerupdate', '2024-08-06 17:01:42', '[{\"id\":9,\"name\":\"Spring Cloud\",\"parentId\":5,\"level\":2,\"number\":10}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (307, '根据id更新文章', 'UPDATE', 'com.mblog.controller.admin.ArticleControllerupdate', '2024-08-16 10:22:23', '[{\"title\":\"dddd\",\"text\":null,\"intro\":\"ddddd\",\"categoryName\":\"微服务相关\",\"filePath\":\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\",\"originTitle\":\"dddd\"}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (308, '根据id更新文章', 'UPDATE', 'com.mblog.controller.admin.ArticleControllerupdate', '2024-08-16 10:23:06', '[{\"title\":\"test\",\"text\":null,\"intro\":\"ddddd\",\"categoryName\":\"微服务相关\",\"filePath\":\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\",\"originTitle\":\"test\"}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (309, '根据id更新文章', 'UPDATE', 'com.mblog.controller.admin.ArticleControllerupdate', '2024-08-16 10:25:05', '[{\"title\":\"test\",\"text\":null,\"intro\":\"ddddd\",\"categoryName\":\"微服务相关\",\"filePath\":\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\",\"originTitle\":\"test\"}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (310, '根据id更新文章', 'UPDATE', 'com.mblog.controller.admin.ArticleControllerupdate', '2024-08-16 10:41:11', '[{\"title\":\"test\",\"text\":null,\"intro\":\"ddddd\",\"categoryName\":\"微服务相关\",\"filePath\":\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\",\"originTitle\":\"dddd\"}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (311, '根据id更新文章', 'UPDATE', 'com.mblog.controller.admin.ArticleControllerupdate', '2024-08-16 10:45:21', '[{\"title\":\"test1\",\"text\":null,\"intro\":\"ddddd\",\"categoryName\":\"微服务相关\",\"filePath\":\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\",\"originTitle\":\"test\"}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (312, '新增文章', 'INSERT', 'com.mblog.controller.admin.ArticleControllersave', '2024-08-16 10:46:51', '[{\"title\":\"test2345\",\"text\":null,\"intro\":\"test2345\",\"categoryName\":\"408相关\",\"filePath\":\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\",\"originTitle\":\"test1\"}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (313, '新增文章', 'INSERT', 'com.mblog.controller.admin.ArticleControllersave', '2024-08-16 10:48:57', '[{\"title\":\"test2345\",\"text\":null,\"intro\":\"test2345\",\"categoryName\":\"微服务相关\",\"filePath\":\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\",\"originTitle\":\"test1\"}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (314, '新增文章', 'INSERT', 'com.mblog.controller.admin.ArticleControllersave', '2024-08-16 10:49:47', '[{\"title\":\"test111\",\"text\":null,\"intro\":\"test111\",\"categoryName\":\"微服务相关\",\"filePath\":\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\",\"originTitle\":\"test2345\"}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (315, '新增文章', 'INSERT', 'com.mblog.controller.admin.ArticleControllersave', '2024-08-16 10:51:53', '[{\"title\":\"test222\",\"text\":null,\"intro\":\"test1222\",\"categoryName\":\"微服务相关\",\"filePath\":\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\",\"originTitle\":\"test111\"}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (316, '更新文章和用户点赞信息', 'UPDATE', 'com.mblog.controller.user.ArticleControllerupdateLike', '2024-09-03 14:28:37', '[{\"browserId\":\"a94cff98788fe0fe90ba25618d3643e7\",\"articleTitle\":\"test222\",\"likeflag\":1,\"loveflag\":0,\"smileflag\":0}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (317, '更新文章和用户点赞信息', 'UPDATE', 'com.mblog.controller.user.ArticleControllerupdateLike', '2024-09-03 14:28:50', '[{\"browserId\":\"a94cff98788fe0fe90ba25618d3643e7\",\"articleTitle\":\"test222\",\"likeflag\":0,\"loveflag\":1,\"smileflag\":0}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (318, '更新文章和用户点赞信息', 'UPDATE', 'com.mblog.controller.user.ArticleControllerupdateLike', '2024-09-03 14:29:30', '[{\"browserId\":\"a94cff98788fe0fe90ba25618d3643e7\",\"articleTitle\":\"计算机网络面试题\",\"likeflag\":1,\"loveflag\":0,\"smileflag\":0}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (319, '更新文章和用户点赞信息', 'UPDATE', 'com.mblog.controller.user.ArticleControllerupdateLike', '2024-09-03 14:29:56', '[{\"browserId\":\"a94cff98788fe0fe90ba25618d3643e7\",\"articleTitle\":\"Redis\",\"likeflag\":1,\"loveflag\":0,\"smileflag\":0}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (320, '更新文章和用户点赞信息', 'UPDATE', 'com.mblog.controller.user.ArticleControllerupdateLike', '2024-09-03 14:30:05', '[{\"browserId\":\"a94cff98788fe0fe90ba25618d3643e7\",\"articleTitle\":\"《计算机应用》期刊投稿流程\",\"likeflag\":1,\"loveflag\":0,\"smileflag\":0}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (321, '更新文章和用户点赞信息', 'UPDATE', 'com.mblog.controller.user.ArticleControllerupdateLike', '2024-09-03 15:04:02', '[{\"browserId\":\"a94cff98788fe0fe90ba25618d3643e7\",\"articleTitle\":\"spmv (10)\",\"likeflag\":1,\"loveflag\":0,\"smileflag\":0}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (322, '新增备忘', 'INSERT', 'com.mblog.controller.admin.MemoControllersave', '2024-09-04 11:12:29', '[{\"id\":null,\"name\":\"l离职\",\"date\":\"2024-09-04 08:00:00\",\"tag\":0,\"status\":0}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (323, '根据id修改备忘', 'UPDATE', 'com.mblog.controller.admin.MemoControllerupdate', '2024-09-04 11:12:40', '[{\"id\":5,\"name\":\"离职\",\"date\":\"2024-09-04 08:00:00\",\"tag\":0,\"status\":0}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (324, '根据id修改备忘', 'UPDATE', 'com.mblog.controller.admin.MemoControllerupdate', '2024-09-04 11:13:21', '[{\"id\":5,\"name\":null,\"date\":null,\"tag\":null,\"status\":1}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (325, '根据id修改备忘', 'UPDATE', 'com.mblog.controller.admin.MemoControllerupdate', '2024-09-04 11:18:19', '[{\"id\":5,\"name\":null,\"date\":null,\"tag\":null,\"status\":0}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (326, '根据id修改备忘', 'UPDATE', 'com.mblog.controller.admin.MemoControllerupdate', '2024-09-04 11:18:20', '[{\"id\":5,\"name\":null,\"date\":null,\"tag\":null,\"status\":1}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (327, '根据id删除备忘', 'DELETE', 'com.mblog.controller.admin.MemoControllerdelete', '2024-09-04 11:18:21', '[5]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (328, '根据id删除文章', 'DELETE', 'com.mblog.controller.admin.ArticleControllerdeleteById', '2024-09-05 14:56:36', '[215,\"C:/Program Files/Code/JavaProject/blog-vue/public/mymd\"]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (329, '分类名不能为空', 'unknown', '/admin/article', '2024-09-05 15:01:24', 'unknown', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_oper_log` VALUES (330, '根据id删除文章', 'DELETE', 'com.mblog.controller.admin.ArticleControllerdeleteById', '2024-09-05 15:13:19', '[1,\"\\\"\\\"\"]', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_oper_log` VALUES (331, '根据id删除文章', 'DELETE', 'com.mblog.controller.admin.ArticleControllerdeleteById', '2024-09-05 15:25:49', '[0,\"\\\"dddd\\\"\"]', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_oper_log` VALUES (332, '根据id删除文章', 'DELETE', 'com.mblog.controller.admin.ArticleControllerdeleteById', '2024-09-05 15:28:25', '[0,\"\\\"dddd\\\"\"]', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_oper_log` VALUES (333, '根据id删除文章', 'DELETE', 'com.mblog.controller.admin.ArticleControllerdeleteById', '2024-09-05 15:30:24', '[0,\"\\\"dddd\\\"\"]', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_oper_log` VALUES (334, '根据id删除文章', 'DELETE', 'com.mblog.controller.admin.ArticleControllerdeleteById', '2024-09-05 15:31:13', '[1,\"\\\"\\\"\"]', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_oper_log` VALUES (335, '根据id删除文章', 'DELETE', 'com.mblog.controller.admin.ArticleControllerdeleteById', '2024-09-05 15:32:48', '[1,\"\\\"\\\"\"]', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_oper_log` VALUES (336, '根据id删除文章', 'DELETE', 'com.mblog.controller.admin.ArticleControllerdeleteById', '2024-09-05 15:32:54', '[1,\"\"]', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_oper_log` VALUES (337, '根据id删除文章', 'DELETE', 'com.mblog.controller.admin.ArticleControllerdeleteById', '2024-09-05 15:33:25', '[1,\"\"]', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_oper_log` VALUES (338, '根据id删除文章', 'DELETE', 'com.mblog.controller.admin.ArticleControllerdeleteById', '2024-09-05 15:33:32', '[1,\"\"]', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_oper_log` VALUES (339, '根据id删除文章', 'DELETE', 'com.mblog.controller.admin.ArticleControllerdeleteById', '2024-09-05 15:33:35', '[1,\"\\\"\\\"\"]', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_oper_log` VALUES (340, '根据id删除文章', 'DELETE', 'com.mblog.controller.admin.ArticleControllerdeleteById', '2024-09-05 15:35:26', '[1,\"\\\"\\\"\"]', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_oper_log` VALUES (341, '根据id删除文章', 'DELETE', 'com.mblog.controller.admin.ArticleControllerdeleteById', '2024-09-05 15:41:36', '[1,\"\\\"\\\"\"]', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_oper_log` VALUES (342, '根据id删除文章', 'DELETE', 'com.mblog.controller.admin.ArticleControllerdeleteById', '2024-09-05 15:42:24', '[1,\"\"]', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_oper_log` VALUES (343, '根据id删除文章', 'DELETE', 'com.mblog.controller.admin.ArticleControllerdeleteById', '2024-09-05 15:42:52', '[1,\"\\\"\\\"\"]', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_oper_log` VALUES (344, '根据id删除文章', 'DELETE', 'com.mblog.controller.admin.ArticleControllerdeleteById', '2024-09-05 15:43:10', '[1,\"\'\'\"]', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_oper_log` VALUES (345, '根据id删除文章', 'DELETE', 'com.mblog.controller.admin.ArticleControllerdeleteById', '2024-09-05 15:44:07', '[1,\"\\\"     \\\"\"]', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_oper_log` VALUES (346, '根据id删除文章', 'DELETE', 'com.mblog.controller.admin.ArticleControllerdeleteById', '2024-09-05 15:44:21', '[1,\"      \"]', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_oper_log` VALUES (347, '根据id删除文章', 'DELETE', 'com.mblog.controller.admin.ArticleControllerdeleteById', '2024-09-05 15:45:07', '[1,\"      \"]', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_oper_log` VALUES (348, '根据id删除文章', 'DELETE', 'com.mblog.controller.admin.ArticleControllerdeleteById', '2024-09-05 15:50:01', '[1,\"\"]', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_oper_log` VALUES (349, '根据id删除文章', 'DELETE', 'com.mblog.controller.admin.ArticleControllerdeleteById', '2024-09-05 15:58:38', '[0,\"test\"]', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_oper_log` VALUES (350, '根据id删除文章', 'DELETE', 'com.mblog.controller.admin.ArticleControllerdeleteById', '2024-09-05 16:01:15', '[-5,\"test\"]', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_oper_log` VALUES (351, '根据id删除文章', 'DELETE', 'com.mblog.controller.admin.ArticleControllerdeleteById', '2024-09-05 16:01:40', '[0,\"test\"]', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_oper_log` VALUES (352, '根据id删除文章', 'DELETE', 'com.mblog.controller.admin.ArticleControllerdeleteById', '2024-09-05 16:01:45', '[0,\"test\"]', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_oper_log` VALUES (353, '根据id删除文章', 'DELETE', 'com.mblog.controller.admin.ArticleControllerdeleteById', '2024-09-05 16:03:11', '[0,\"test\"]', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_oper_log` VALUES (354, '根据id删除文章', 'DELETE', 'com.mblog.controller.admin.ArticleControllerdeleteById', '2024-09-05 16:04:00', '[0,\"test\"]', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_oper_log` VALUES (355, 'deleteById.id: 最小不能小于1', 'unknown', '/admin/article', '2024-09-05 16:04:00', 'unknown', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_oper_log` VALUES (356, '根据id删除文章', 'DELETE', 'com.mblog.controller.admin.ArticleControllerdeleteById', '2024-09-05 16:04:19', '[-5,\"test\"]', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_oper_log` VALUES (357, 'deleteById.id: 最小不能小于1', 'unknown', '/admin/article', '2024-09-05 16:04:19', 'unknown', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_oper_log` VALUES (358, '根据id删除文章', 'DELETE', 'com.mblog.controller.admin.ArticleControllerdeleteById', '2024-09-05 16:04:33', '[1,\"\"]', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_oper_log` VALUES (359, 'deleteById.filePath: 文件路径不能为空', 'unknown', '/admin/article', '2024-09-05 16:04:33', 'unknown', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_oper_log` VALUES (360, 'Required request parameter \'id\' for method parameter type Integer is present but converted to null', 'unknown', '/admin/article', '2024-09-05 16:23:41', 'unknown', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_oper_log` VALUES (361, 'Required request parameter \'id\' for method parameter type Integer is present but converted to null', 'unknown', '/admin/article', '2024-09-05 16:31:33', 'unknown', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_oper_log` VALUES (362, 'Required request parameter \'id\' for method parameter type Integer is present but converted to null', 'unknown', '/admin/article', '2024-09-05 16:32:02', 'unknown', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_oper_log` VALUES (363, 'Required request parameter \'id\' for method parameter type Integer is present but converted to null', 'unknown', '/admin/article', '2024-09-05 16:32:17', 'unknown', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_oper_log` VALUES (364, '根据id删除文章', 'DELETE', 'com.mblog.controller.admin.ArticleControllerdeleteById', '2024-09-05 16:32:42', '[0,\"222\"]', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_oper_log` VALUES (365, 'deleteById.id: 最小不能小于1', 'unknown', '/admin/article', '2024-09-05 16:32:42', 'unknown', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_oper_log` VALUES (366, 'Failed to convert value of type \'java.lang.String\' to required type \'java.lang.Integer\'; nested exception is java.lang.NumberFormatException: For input string: \"test\"', 'unknown', '/admin/article', '2024-09-05 16:32:53', 'unknown', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_oper_log` VALUES (367, 'Failed to convert value of type \'java.lang.String\' to required type \'java.lang.Integer\'; nested exception is java.lang.NumberFormatException: For input string: \"test\"', 'unknown', '/admin/article', '2024-09-05 16:40:43', 'unknown', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_oper_log` VALUES (368, 'Required request parameter \'id\' for method parameter type Integer is present but converted to null', 'unknown', '/admin/article', '2024-09-05 16:41:06', 'unknown', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_oper_log` VALUES (369, '根据id删除文章', 'DELETE', 'com.mblog.controller.admin.ArticleControllerdeleteById', '2024-09-05 16:41:32', '[0,\"222\"]', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_oper_log` VALUES (370, 'deleteById.id: 最小不能小于1', 'unknown', '/admin/article', '2024-09-05 16:41:32', 'unknown', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_oper_log` VALUES (371, '新增备忘', 'INSERT', 'com.mblog.controller.admin.MemoControllersave', '2024-09-05 16:56:33', '[{\"id\":null,\"name\":\"test\",\"date\":\"2024-09-05 08:00:00\",\"tag\":0,\"status\":0}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (372, '根据id删除文章', 'DELETE', 'com.mblog.controller.admin.ArticleControllerdeleteById', '2024-09-05 17:01:28', '[1,\"\"]', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_oper_log` VALUES (373, 'deleteById.filePath: 文件路径不能为空', 'unknown', '/admin/article', '2024-09-05 17:01:28', 'unknown', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_oper_log` VALUES (374, 'Required request parameter \'order\' for method parameter type Integer is not present', 'unknown', '/user/article/list', '2024-09-06 08:45:29', 'unknown', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_oper_log` VALUES (375, 'nested exception is org.apache.ibatis.binding.BindingException: Parameter \'searchValue\' not found. Available parameters are [pageSize, currentPage, param3, categoryName, param1, param2]', 'unknown', '/user/article/list', '2024-09-06 08:46:06', 'unknown', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_oper_log` VALUES (376, 'nested exception is org.apache.ibatis.binding.BindingException: Parameter \'searchValue\' not found. Available parameters are [pageSize, currentPage, param3, categoryName, param1, param2]', 'unknown', '/user/article/list', '2024-09-06 08:46:25', 'unknown', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_oper_log` VALUES (377, 'nested exception is org.apache.ibatis.binding.BindingException: Parameter \'searchValue\' not found. Available parameters are [pageSize, currentPage, param3, categoryName, param1, param2]', 'unknown', '/user/article/list', '2024-09-06 08:46:33', 'unknown', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_oper_log` VALUES (378, 'nested exception is org.apache.ibatis.binding.BindingException: Parameter \'searchValue\' not found. Available parameters are [pageSize, currentPage, param3, categoryName, param1, param2]', 'unknown', '/user/article/list', '2024-09-06 08:47:09', 'unknown', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_oper_log` VALUES (379, 'nested exception is org.apache.ibatis.binding.BindingException: Parameter \'searchValue\' not found. Available parameters are [pageSize, currentPage, param3, categoryName, param1, param2]', 'unknown', '/user/article/list', '2024-09-06 08:48:12', 'unknown', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_oper_log` VALUES (380, 'nested exception is org.apache.ibatis.binding.BindingException: Parameter \'searchValue\' not found. Available parameters are [pageSize, currentPage, param3, categoryName, param1, param2]', 'unknown', '/user/article/list', '2024-09-06 08:49:03', 'unknown', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_oper_log` VALUES (381, 'Required request parameter \'searchValue\' for method parameter type String is not present', 'unknown', '/user/article/list/', '2024-09-06 13:57:17', 'unknown', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (382, 'Required request parameter \'searchValue\' for method parameter type String is not present', 'unknown', '/user/article/list/', '2024-09-06 13:57:20', 'unknown', '127.0.0.1');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `permission` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', 'c83080e9c2f92605b2df308ff9389b22', 2);

-- ----------------------------
-- Table structure for userlike
-- ----------------------------
DROP TABLE IF EXISTS `userlike`;
CREATE TABLE `userlike`  (
  `browserId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `articleId` int NOT NULL,
  `likeflag` int NULL DEFAULT NULL,
  `loveflag` int NULL DEFAULT NULL,
  `smileflag` int NULL DEFAULT NULL,
  PRIMARY KEY (`browserId`, `articleId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of userlike
-- ----------------------------
INSERT INTO `userlike` VALUES ('\'-var_dump(md5(844719886))-\'', 186, 0, 0, 0);
INSERT INTO `userlike` VALUES ('156154fa0b472a5bbaeecb74d06e0464', 186, 0, 0, 0);
INSERT INTO `userlike` VALUES ('156154fa0b472a5bbaeecb74d06e0464\nexpr 897393456 + 802188388\n', 186, 0, 0, 0);
INSERT INTO `userlike` VALUES ('156154fa0b472a5bbaeecb74d06e0464&set /A 974777525+996661688', 186, 0, 0, 0);
INSERT INTO `userlike` VALUES ('156154fa0b472a5bbaeecb74d06e0464|expr 815354582 + 858473739 ', 186, 0, 0, 0);
INSERT INTO `userlike` VALUES ('156154fa0b472a5bbaeecb74d06e0464$(expr 832425677 + 834249738)', 186, 0, 0, 0);
INSERT INTO `userlike` VALUES ('1c43d36846ec4ae6966203d6d61bcadf', 172, 0, 0, 0);
INSERT INTO `userlike` VALUES ('1f6ef0e125e5682a0097f3552563765d', 63, 0, 0, 0);
INSERT INTO `userlike` VALUES ('1f6ef0e125e5682a0097f3552563765d', 142, 0, 0, 0);
INSERT INTO `userlike` VALUES ('1f6ef0e125e5682a0097f3552563765d', 154, 0, 0, 0);
INSERT INTO `userlike` VALUES ('1f6ef0e125e5682a0097f3552563765d', 155, 0, 0, 0);
INSERT INTO `userlike` VALUES ('1f6ef0e125e5682a0097f3552563765d', 156, 0, 0, 0);
INSERT INTO `userlike` VALUES ('1f6ef0e125e5682a0097f3552563765d', 157, 0, 0, 0);
INSERT INTO `userlike` VALUES ('1f6ef0e125e5682a0097f3552563765d', 158, 0, 0, 0);
INSERT INTO `userlike` VALUES ('1f6ef0e125e5682a0097f3552563765d', 159, 0, 0, 0);
INSERT INTO `userlike` VALUES ('1f6ef0e125e5682a0097f3552563765d', 160, 0, 0, 0);
INSERT INTO `userlike` VALUES ('1f6ef0e125e5682a0097f3552563765d', 162, 0, 0, 0);
INSERT INTO `userlike` VALUES ('1f6ef0e125e5682a0097f3552563765d', 164, 0, 0, 0);
INSERT INTO `userlike` VALUES ('1f6ef0e125e5682a0097f3552563765d', 165, 0, 0, 0);
INSERT INTO `userlike` VALUES ('1f6ef0e125e5682a0097f3552563765d', 166, 0, 0, 0);
INSERT INTO `userlike` VALUES ('1f6ef0e125e5682a0097f3552563765d', 167, 0, 0, 0);
INSERT INTO `userlike` VALUES ('1f6ef0e125e5682a0097f3552563765d', 168, 0, 0, 0);
INSERT INTO `userlike` VALUES ('1f6ef0e125e5682a0097f3552563765d', 169, 0, 0, 0);
INSERT INTO `userlike` VALUES ('1f6ef0e125e5682a0097f3552563765d', 170, 0, 0, 0);
INSERT INTO `userlike` VALUES ('1f6ef0e125e5682a0097f3552563765d', 171, 0, 0, 0);
INSERT INTO `userlike` VALUES ('1f6ef0e125e5682a0097f3552563765d', 173, 0, 0, 0);
INSERT INTO `userlike` VALUES ('1f6ef0e125e5682a0097f3552563765d', 174, 0, 1, 0);
INSERT INTO `userlike` VALUES ('1f6ef0e125e5682a0097f3552563765d', 175, 0, 0, 0);
INSERT INTO `userlike` VALUES ('1f6ef0e125e5682a0097f3552563765d', 176, 0, 0, 0);
INSERT INTO `userlike` VALUES ('1f6ef0e125e5682a0097f3552563765d', 177, 0, 0, 0);
INSERT INTO `userlike` VALUES ('1f6ef0e125e5682a0097f3552563765d', 178, 0, 0, 0);
INSERT INTO `userlike` VALUES ('1f6ef0e125e5682a0097f3552563765d', 179, 0, 0, 0);
INSERT INTO `userlike` VALUES ('1f6ef0e125e5682a0097f3552563765d', 180, 0, 0, 0);
INSERT INTO `userlike` VALUES ('1f6ef0e125e5682a0097f3552563765d', 181, 0, 0, 0);
INSERT INTO `userlike` VALUES ('1f6ef0e125e5682a0097f3552563765d', 182, 0, 0, 0);
INSERT INTO `userlike` VALUES ('1f6ef0e125e5682a0097f3552563765d', 183, 0, 0, 0);
INSERT INTO `userlike` VALUES ('1f6ef0e125e5682a0097f3552563765d', 184, 0, 0, 0);
INSERT INTO `userlike` VALUES ('1f6ef0e125e5682a0097f3552563765d', 185, 0, 0, 0);
INSERT INTO `userlike` VALUES ('1f6ef0e125e5682a0097f3552563765d', 186, 0, 0, 0);
INSERT INTO `userlike` VALUES ('25799557373a2ae3954b158906ee4756', 62, 0, 0, 0);
INSERT INTO `userlike` VALUES ('25799557373a2ae3954b158906ee4756', 63, 0, 0, 0);
INSERT INTO `userlike` VALUES ('25799557373a2ae3954b158906ee4756', 175, 0, 0, 0);
INSERT INTO `userlike` VALUES ('25799557373a2ae3954b158906ee4756', 182, 0, 0, 0);
INSERT INTO `userlike` VALUES ('25799557373a2ae3954b158906ee4756', 183, 0, 0, 0);
INSERT INTO `userlike` VALUES ('26388cacd91c10123258e7f44fec2dda', 60, 0, 0, 0);
INSERT INTO `userlike` VALUES ('26388cacd91c10123258e7f44fec2dda', 61, 0, 0, 0);
INSERT INTO `userlike` VALUES ('26388cacd91c10123258e7f44fec2dda', 77, 0, 0, 0);
INSERT INTO `userlike` VALUES ('26388cacd91c10123258e7f44fec2dda', 130, 0, 0, 0);
INSERT INTO `userlike` VALUES ('26388cacd91c10123258e7f44fec2dda', 132, 0, 0, 0);
INSERT INTO `userlike` VALUES ('26388cacd91c10123258e7f44fec2dda', 133, 0, 0, 0);
INSERT INTO `userlike` VALUES ('26388cacd91c10123258e7f44fec2dda', 135, 0, 0, 0);
INSERT INTO `userlike` VALUES ('26388cacd91c10123258e7f44fec2dda', 164, 0, 0, 0);
INSERT INTO `userlike` VALUES ('26388cacd91c10123258e7f44fec2dda', 172, 0, 0, 0);
INSERT INTO `userlike` VALUES ('27ab17de9be081bc6378923215f734d4', 157, 0, 0, 0);
INSERT INTO `userlike` VALUES ('27ab17de9be081bc6378923215f734d4', 183, 0, 0, 0);
INSERT INTO `userlike` VALUES ('27ab17de9be081bc6378923215f734d4', 184, 0, 0, 0);
INSERT INTO `userlike` VALUES ('27ab17de9be081bc6378923215f734d4', 185, 0, 0, 0);
INSERT INTO `userlike` VALUES ('27ab17de9be081bc6378923215f734d4', 186, 0, 0, 0);
INSERT INTO `userlike` VALUES ('2c11fa89cfec9be8632473be45784632', 164, 0, 0, 0);
INSERT INTO `userlike` VALUES ('2c11fa89cfec9be8632473be45784632', 170, 0, 0, 0);
INSERT INTO `userlike` VALUES ('2c11fa89cfec9be8632473be45784632', 176, 0, 0, 0);
INSERT INTO `userlike` VALUES ('2c11fa89cfec9be8632473be45784632', 183, 0, 0, 0);
INSERT INTO `userlike` VALUES ('2c11fa89cfec9be8632473be45784632', 186, 0, 0, 0);
INSERT INTO `userlike` VALUES ('32347efca7c20eb4c287152060e61903', 170, 0, 0, 0);
INSERT INTO `userlike` VALUES ('32347efca7c20eb4c287152060e61903', 178, 0, 0, 0);
INSERT INTO `userlike` VALUES ('32347efca7c20eb4c287152060e61903', 179, 0, 0, 0);
INSERT INTO `userlike` VALUES ('32347efca7c20eb4c287152060e61903', 183, 0, 0, 0);
INSERT INTO `userlike` VALUES ('32347efca7c20eb4c287152060e61903', 186, 0, 0, 0);
INSERT INTO `userlike` VALUES ('3880dd23da786769ce92bb2f5f5aabf4', 62, 0, 0, 0);
INSERT INTO `userlike` VALUES ('3880dd23da786769ce92bb2f5f5aabf4', 63, 0, 0, 0);
INSERT INTO `userlike` VALUES ('3880dd23da786769ce92bb2f5f5aabf4', 170, 0, 0, 0);
INSERT INTO `userlike` VALUES ('3880dd23da786769ce92bb2f5f5aabf4', 179, 0, 0, 0);
INSERT INTO `userlike` VALUES ('3880dd23da786769ce92bb2f5f5aabf4', 183, 0, 0, 0);
INSERT INTO `userlike` VALUES ('3880dd23da786769ce92bb2f5f5aabf4', 185, 0, 0, 0);
INSERT INTO `userlike` VALUES ('3e4491828df6394646ddff95a7b7429c', 72, 0, 0, 0);
INSERT INTO `userlike` VALUES ('3e4491828df6394646ddff95a7b7429c', 128, 0, 0, 0);
INSERT INTO `userlike` VALUES ('3f0b2af119bae6f52df2f176f6ff6b61', 179, 0, 0, 0);
INSERT INTO `userlike` VALUES ('3f0b2af119bae6f52df2f176f6ff6b61', 180, 0, 0, 0);
INSERT INTO `userlike` VALUES ('3f0b2af119bae6f52df2f176f6ff6b61', 183, 0, 0, 0);
INSERT INTO `userlike` VALUES ('3f0b2af119bae6f52df2f176f6ff6b61', 185, 0, 0, 0);
INSERT INTO `userlike` VALUES ('3f0b2af119bae6f52df2f176f6ff6b61', 186, 0, 0, 0);
INSERT INTO `userlike` VALUES ('4b9da70a34be2798c46c7b9d58aff713', 182, 0, 0, 0);
INSERT INTO `userlike` VALUES ('4b9da70a34be2798c46c7b9d58aff713', 183, 0, 0, 0);
INSERT INTO `userlike` VALUES ('4b9da70a34be2798c46c7b9d58aff713', 186, 0, 0, 0);
INSERT INTO `userlike` VALUES ('53fcfb9d4251d29f6fbc42fa1bcc8bd9', 171, 0, 0, 0);
INSERT INTO `userlike` VALUES ('570f7ebb8ad6f035d3e869d83497f65e', 182, 0, 0, 0);
INSERT INTO `userlike` VALUES ('570f7ebb8ad6f035d3e869d83497f65e', 183, 0, 0, 0);
INSERT INTO `userlike` VALUES ('570f7ebb8ad6f035d3e869d83497f65e', 184, 0, 0, 0);
INSERT INTO `userlike` VALUES ('570f7ebb8ad6f035d3e869d83497f65e', 185, 1, 0, 0);
INSERT INTO `userlike` VALUES ('570f7ebb8ad6f035d3e869d83497f65e', 186, 0, 0, 0);
INSERT INTO `userlike` VALUES ('570f7ebb8ad6f035d3e869d83497f65e', 215, 0, 0, 0);
INSERT INTO `userlike` VALUES ('5ace78dd9ec17360dca3e71b6af95161', 171, 1, 1, 0);
INSERT INTO `userlike` VALUES ('5ace78dd9ec17360dca3e71b6af95161', 172, 1, 1, 1);
INSERT INTO `userlike` VALUES ('623e197494c0c392c9c3d7cb9f5be078', 142, 0, 0, 0);
INSERT INTO `userlike` VALUES ('6a1df3ed231c8297cce293db13382f9f', 177, 0, 0, 0);
INSERT INTO `userlike` VALUES ('79c75f33fc7fbd3578ebc69552fc1707', 170, 0, 0, 0);
INSERT INTO `userlike` VALUES ('89c6a6666cd304eb137f41deef6348ae', 164, 0, 0, 0);
INSERT INTO `userlike` VALUES ('89c6a6666cd304eb137f41deef6348ae', 176, 0, 0, 0);
INSERT INTO `userlike` VALUES ('89c6a6666cd304eb137f41deef6348ae', 178, 0, 0, 0);
INSERT INTO `userlike` VALUES ('89c6a6666cd304eb137f41deef6348ae', 179, 0, 0, 0);
INSERT INTO `userlike` VALUES ('9920a23cf8573d317e019d2c63e81bd1', 66, 0, 0, 0);
INSERT INTO `userlike` VALUES ('9920a23cf8573d317e019d2c63e81bd1', 68, 0, 0, 0);
INSERT INTO `userlike` VALUES ('9920a23cf8573d317e019d2c63e81bd1', 72, 0, 0, 0);
INSERT INTO `userlike` VALUES ('9920a23cf8573d317e019d2c63e81bd1', 73, 0, 0, 0);
INSERT INTO `userlike` VALUES ('9920a23cf8573d317e019d2c63e81bd1', 74, 0, 0, 0);
INSERT INTO `userlike` VALUES ('a041c2066fe3e4d3318e473fd30af43e', 142, 0, 0, 0);
INSERT INTO `userlike` VALUES ('a041c2066fe3e4d3318e473fd30af43e', 164, 0, 0, 0);
INSERT INTO `userlike` VALUES ('a041c2066fe3e4d3318e473fd30af43e', 165, 0, 0, 0);
INSERT INTO `userlike` VALUES ('a041c2066fe3e4d3318e473fd30af43e', 169, 0, 0, 0);
INSERT INTO `userlike` VALUES ('a041c2066fe3e4d3318e473fd30af43e', 173, 0, 0, 0);
INSERT INTO `userlike` VALUES ('a041c2066fe3e4d3318e473fd30af43e', 174, 0, 0, 0);
INSERT INTO `userlike` VALUES ('a041c2066fe3e4d3318e473fd30af43e', 175, 0, 0, 0);
INSERT INTO `userlike` VALUES ('a041c2066fe3e4d3318e473fd30af43e', 176, 0, 0, 0);
INSERT INTO `userlike` VALUES ('a041c2066fe3e4d3318e473fd30af43e', 182, 1, 0, 0);
INSERT INTO `userlike` VALUES ('a041c2066fe3e4d3318e473fd30af43e', 183, 0, 0, 0);
INSERT INTO `userlike` VALUES ('a3715bc57331123ae8f2c87548acbe7c', 58, 0, 0, 0);
INSERT INTO `userlike` VALUES ('a3715bc57331123ae8f2c87548acbe7c', 76, 0, 0, 0);
INSERT INTO `userlike` VALUES ('a3715bc57331123ae8f2c87548acbe7c', 172, 0, 0, 0);
INSERT INTO `userlike` VALUES ('a3715bc57331123ae8f2c87548acbe7c', 173, 0, 0, 0);
INSERT INTO `userlike` VALUES ('a3715bc57331123ae8f2c87548acbe7c', 176, 0, 0, 0);
INSERT INTO `userlike` VALUES ('a94cff98788fe0fe90ba25618d3643e7', 23, 0, 0, 0);
INSERT INTO `userlike` VALUES ('a94cff98788fe0fe90ba25618d3643e7', 82, 1, 0, 0);
INSERT INTO `userlike` VALUES ('a94cff98788fe0fe90ba25618d3643e7', 183, 1, 0, 0);
INSERT INTO `userlike` VALUES ('a94cff98788fe0fe90ba25618d3643e7', 184, 1, 0, 0);
INSERT INTO `userlike` VALUES ('a94cff98788fe0fe90ba25618d3643e7', 186, 1, 0, 0);
INSERT INTO `userlike` VALUES ('a94cff98788fe0fe90ba25618d3643e7', 215, 1, 1, 0);
INSERT INTO `userlike` VALUES ('ab0bddbc22c1e24e04c374d72767481c', 176, 0, 0, 0);
INSERT INTO `userlike` VALUES ('ca069ec849be70fc7992f7901c7d0e86', 172, 1, 0, 0);
INSERT INTO `userlike` VALUES ('d562b560a414806e4f443ebc6627960d', 60, 0, 0, 0);
INSERT INTO `userlike` VALUES ('d562b560a414806e4f443ebc6627960d', 62, 0, 0, 0);
INSERT INTO `userlike` VALUES ('d562b560a414806e4f443ebc6627960d', 63, 0, 0, 0);
INSERT INTO `userlike` VALUES ('d562b560a414806e4f443ebc6627960d', 151, 0, 0, 0);
INSERT INTO `userlike` VALUES ('d562b560a414806e4f443ebc6627960d', 152, 0, 0, 0);
INSERT INTO `userlike` VALUES ('d562b560a414806e4f443ebc6627960d', 153, 0, 0, 0);
INSERT INTO `userlike` VALUES ('d562b560a414806e4f443ebc6627960d', 154, 0, 0, 0);
INSERT INTO `userlike` VALUES ('d562b560a414806e4f443ebc6627960d', 155, 0, 0, 0);
INSERT INTO `userlike` VALUES ('d562b560a414806e4f443ebc6627960d', 156, 0, 0, 0);
INSERT INTO `userlike` VALUES ('d562b560a414806e4f443ebc6627960d', 157, 0, 0, 0);
INSERT INTO `userlike` VALUES ('d562b560a414806e4f443ebc6627960d', 158, 0, 0, 0);
INSERT INTO `userlike` VALUES ('d562b560a414806e4f443ebc6627960d', 159, 0, 0, 0);
INSERT INTO `userlike` VALUES ('d562b560a414806e4f443ebc6627960d', 160, 0, 0, 0);
INSERT INTO `userlike` VALUES ('d562b560a414806e4f443ebc6627960d', 162, 0, 0, 0);
INSERT INTO `userlike` VALUES ('d562b560a414806e4f443ebc6627960d', 164, 0, 0, 0);
INSERT INTO `userlike` VALUES ('d562b560a414806e4f443ebc6627960d', 165, 0, 0, 0);
INSERT INTO `userlike` VALUES ('d562b560a414806e4f443ebc6627960d', 166, 0, 0, 0);
INSERT INTO `userlike` VALUES ('d562b560a414806e4f443ebc6627960d', 167, 0, 0, 0);
INSERT INTO `userlike` VALUES ('d562b560a414806e4f443ebc6627960d', 168, 0, 0, 0);
INSERT INTO `userlike` VALUES ('d562b560a414806e4f443ebc6627960d', 169, 0, 0, 0);
INSERT INTO `userlike` VALUES ('d562b560a414806e4f443ebc6627960d', 170, 0, 0, 0);
INSERT INTO `userlike` VALUES ('d562b560a414806e4f443ebc6627960d', 171, 0, 0, 0);
INSERT INTO `userlike` VALUES ('d562b560a414806e4f443ebc6627960d', 172, 0, 0, 0);
INSERT INTO `userlike` VALUES ('d562b560a414806e4f443ebc6627960d', 173, 0, 0, 0);
INSERT INTO `userlike` VALUES ('d562b560a414806e4f443ebc6627960d', 174, 0, 0, 0);
INSERT INTO `userlike` VALUES ('d562b560a414806e4f443ebc6627960d', 175, 0, 0, 0);
INSERT INTO `userlike` VALUES ('d562b560a414806e4f443ebc6627960d', 177, 0, 0, 0);
INSERT INTO `userlike` VALUES ('d562b560a414806e4f443ebc6627960d', 178, 0, 0, 0);
INSERT INTO `userlike` VALUES ('d562b560a414806e4f443ebc6627960d', 179, 0, 0, 0);
INSERT INTO `userlike` VALUES ('d562b560a414806e4f443ebc6627960d', 183, 0, 0, 0);
INSERT INTO `userlike` VALUES ('ddf22ece7412dc5a4418f15611113054', 186, 0, 0, 0);
INSERT INTO `userlike` VALUES ('de758a1ef402fbc087c8f802b6e3e3db', 176, 0, 0, 0);
INSERT INTO `userlike` VALUES ('de758a1ef402fbc087c8f802b6e3e3db', 186, 0, 0, 0);
INSERT INTO `userlike` VALUES ('df8932c3f0a9d4b36c099f604e240d4f', 170, 0, 0, 0);
INSERT INTO `userlike` VALUES ('df8932c3f0a9d4b36c099f604e240d4f', 172, 1, 0, 0);
INSERT INTO `userlike` VALUES ('ed1aae3d3d16b2c165176a21a48e3ebc', 164, 0, 0, 0);
INSERT INTO `userlike` VALUES ('ef2f4b598b9b9fd873ad24ae31dee1f9', 160, 0, 0, 0);
INSERT INTO `userlike` VALUES ('expr 981507205 + 994682192', 186, 0, 0, 0);
INSERT INTO `userlike` VALUES ('fa3dfa74808819da630417e33b8facb6', 60, 1, 0, 0);
INSERT INTO `userlike` VALUES ('fa3dfa74808819da630417e33b8facb6', 66, 0, 0, 0);
INSERT INTO `userlike` VALUES ('fa3dfa74808819da630417e33b8facb6', 67, 0, 0, 0);
INSERT INTO `userlike` VALUES ('fa3dfa74808819da630417e33b8facb6', 68, 0, 0, 0);
INSERT INTO `userlike` VALUES ('fa3dfa74808819da630417e33b8facb6', 72, 0, 0, 0);
INSERT INTO `userlike` VALUES ('fa3dfa74808819da630417e33b8facb6', 75, 0, 0, 0);
INSERT INTO `userlike` VALUES ('fa3dfa74808819da630417e33b8facb6', 174, 0, 0, 0);
INSERT INTO `userlike` VALUES ('fa3dfa74808819da630417e33b8facb6', 176, 0, 0, 0);
INSERT INTO `userlike` VALUES ('fa3dfa74808819da630417e33b8facb6', 177, 0, 0, 0);
INSERT INTO `userlike` VALUES ('fa3dfa74808819da630417e33b8facb6', 184, 1, 1, 0);
INSERT INTO `userlike` VALUES ('fa3dfa74808819da630417e33b8facb6', 185, 0, 0, 0);
INSERT INTO `userlike` VALUES ('fa3dfa74808819da630417e33b8facb6', 186, 0, 0, 0);

SET FOREIGN_KEY_CHECKS = 1;
