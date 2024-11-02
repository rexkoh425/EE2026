`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.10.2024 22:26:17
// Design Name: 
// Module Name: StartingScreen
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module StartingScreen(
    input clk6p25m,
    input[12:0] pixel_index,
    output reg[15:0] pixel_data
);


always @ (posedge clk6p25m)
begin
case(pixel_index)
   0, 5, 6, 8, 10, 11, 14, 19, 20, 21, 22, 23, 25, 27, 28, 29, 30, 32, 34, 35, 39, 40, 48, 49, 50, 52, 53, 54, 55, 56, 58, 59, 60, 61, 62, 63, 64, 68, 69, 70, 71, 72, 73, 74, 75, 80, 85, 86, 87, 89, 94, 96, 192, 383, 480, 561, 863, 959, 1055, 1151, 1247, 1343, 1439, 1535, 1631, 1727, 1823, 1919, 2015, 2111, 2207, 2303, 2399, 2495, 2591, 2687, 2783, 2879, 2975, 3071, 3840, 3855, 3936, 3953, 3954, 3961, 3962, 3963, 3972, 3973, 3981, 3990, 4032, 4128, 4224, 4258, 4267, 4278, 4285, 4319, 4320, 4344, 4350, 4352, 4353, 4355, 4357, 4358, 4362, 4376, 4381, 4386, 4415, 4416, 4441, 4445, 4446, 4449, 4472, 4474, 4511, 4512, 4541, 4545, 4547, 4549, 4555, 4559, 4574, 4577, 4607, 4608, 4632, 4633, 4637, 4643, 4647, 4651, 4653, 4654, 4655, 4661, 4664, 4703, 4704, 4799, 4800, 4895, 4896, 4938, 4943, 4946, 4953, 4959, 4991, 4992, 5032, 5087, 5088, 5125, 5141, 5150, 5183, 5184, 5231, 5237, 5238, 5239, 5241, 5279, 5280, 5317, 5320, 5322, 5325, 5337, 5375, 5376, 5471, 5567, 5664, 5759, 5952, 6052, 6053, 6055, 6056, 6057, 6058, 6059, 6060, 6061, 6062, 6063, 6064, 6065, 6066, 6067, 6068, 6069, 6070, 6071, 6072, 6073, 6074, 6075, 6076, 6077, 6078, 6089, 6090, 6091, 6096, 6097, 6098, 6099, 6100, 6101, 6110, 6111, 6112, 6113, 6114, 6115, 6116, 6117, 6118, 6119, 6120, 6121, 6122, 6123, 6124, 6125, 6126, 6127, 6128, 6129, 6130, 6131, 6132, 6133, 6134, 6135, 6136, 6142: pixel_data <= 44371;
   1, 4, 83, 84, 90, 91, 3263, 3359, 3455, 4262, 4266, 4280, 4289, 4385, 4461, 4470, 4473, 4537, 4670, 4958, 5030, 5051: pixel_data <= 40081;
   2, 3, 31, 36, 37, 38, 65, 66, 67, 88, 93, 576, 672, 768, 864, 960, 1056, 1152, 1248, 1344, 1440, 1536, 1632, 1728, 1824, 1920, 2016, 2112, 2208, 2304, 2400, 2496, 2592, 2688, 2784, 2880, 2976, 3072, 3168, 3264, 3360, 3456, 3552, 3648, 3744, 3952, 3955, 3957, 3958, 3959, 3966, 3980, 3982, 3983, 3985, 3987, 3998, 4000, 4263, 4345, 4349, 4354, 4361, 4363, 4372, 4374, 4388, 4447, 4448, 4453, 4454, 4455, 4458, 4478, 4481, 4546, 4550, 4554, 4558, 4565, 4570, 4571, 4641, 4662, 4675, 4933, 4937, 4941, 4951, 4957, 5038, 5047, 5135, 5138, 5142, 5145, 5221, 5224, 5234, 5326, 5327, 5335, 5339, 5342, 5472, 5568, 5663, 5855, 5951, 6054, 6079, 6080, 6081, 6082, 6083, 6084, 6085, 6086, 6087, 6088, 6092, 6093, 6094, 6095, 6102, 6103, 6104, 6105, 6106, 6107, 6108, 6109, 6137, 6139, 6140, 6141, 6143: pixel_data <= 46420;
   7, 9, 12, 13, 15, 16, 17, 18, 26, 33, 41, 42, 43, 44, 45, 46, 47, 51, 57, 76, 77, 78, 79, 81, 82, 92, 288, 671, 3167, 3551, 3647, 3743, 3839, 3935, 3991, 3999, 4031, 4127, 4223, 4255, 4271, 4290, 4366, 4382, 4389, 4442, 4459, 4469, 4543, 4564, 4568, 4638, 4642, 4645, 4650, 4660, 4674, 4942, 4947, 4949, 4954, 5042, 5053, 5130, 5133, 5146, 5246, 5333, 6047, 6049, 6138: pixel_data <= 42261;
   24, 384, 575, 767, 3759, 3885, 3895, 3896, 3956, 3964, 3979, 3994, 3995, 4270, 4277, 4286, 4351, 4359, 4367, 4370, 4373, 4379, 4450, 4451, 4462, 4463, 4475, 4538, 4542, 4667, 4936, 4950, 4955, 5033, 5037, 5049, 5050, 5054, 5128, 5143, 5226, 5321, 5760, 5856, 6048, 6050: pixel_data <= 48533;
   95, 287, 479, 496, 501, 502, 503, 514, 515, 516, 517, 518, 519, 520, 528, 529, 530, 532, 533, 534, 535, 536, 538, 539, 540, 541, 542, 543, 544, 545, 546, 547, 548, 549, 550, 551, 552, 553, 554, 559, 657, 783, 879, 975, 1071, 1167, 1263, 1302, 1359, 1455, 1551, 1647, 1743, 1839, 2319, 2415, 2511, 2607, 2703, 2799, 2895, 3375, 3567, 3663, 3859, 3862, 3877, 3884, 3888, 3920, 3921, 3965, 3967, 3971, 3978, 3989, 4457, 4646, 4673, 4934, 4945, 5029, 5045, 5134, 6051: pixel_data <= 50450;
   97, 193, 385, 408, 409, 410, 411, 412, 413, 414, 415, 448, 449, 450, 451, 452, 453, 478, 481, 590, 673, 686, 769, 782, 865, 878, 961, 974, 1057, 1070, 1153, 1166, 1249, 1262, 1345, 1358, 1441, 1454, 1537, 1550, 1633, 1646, 1729, 1742, 1825, 1838, 1921, 1934, 2017, 2030, 2113, 2126, 2209, 2222, 2305, 2318, 2401, 2414, 2497, 2510, 2593, 2606, 2689, 2702, 2785, 2798, 2881, 2894, 2977, 2990, 3073, 3086, 3169, 3182, 3265, 3278, 3361, 3374, 3457, 3470, 3553, 3566, 3649, 3745, 3841, 3951, 3984, 4257, 4269, 4283, 4291, 4293, 4371, 4377, 4378, 4443, 4477, 4485, 4536, 4539, 4544, 4557, 4573, 4576, 4669, 4728, 4729, 4733, 4734, 4737, 4739, 4750, 4757, 4758, 4763, 4765, 4766, 4771, 4932, 4939, 5039, 5043, 5048, 5140, 5225, 5229, 5230, 5245, 5318, 5334, 5336, 5341, 5417, 5422, 5473, 5569, 5665, 5761, 5854, 5857, 5950, 5954, 5956, 5957, 5958, 5960, 5962, 5963, 5964, 5965, 5966, 5967, 5968, 5969, 5970, 5971, 5972, 5973, 5974, 5975, 5976, 5977, 5978, 5979, 5980, 5981, 5982, 5983, 5984, 5985, 5986, 5987, 5988, 5989, 5990, 5991, 5993, 5994, 5995, 5996, 5997, 5998, 6000, 6002, 6003, 6004, 6005, 6006, 6007, 6008, 6009, 6010, 6011, 6012, 6013, 6014, 6015, 6016, 6017, 6018, 6019, 6020, 6021, 6022, 6023, 6024, 6025, 6026, 6027, 6028, 6029, 6030, 6031, 6032, 6033, 6034, 6035, 6036, 6037, 6038, 6039, 6041, 6045: pixel_data <= 16838;
   98, 103, 104, 106, 107, 108, 109, 111, 115, 116, 117, 118, 119, 122, 123, 125, 126, 127, 130, 131, 132, 133, 134, 135, 136, 144, 145, 148, 149, 150, 151, 152, 154, 155, 156, 157, 158, 159, 160, 161, 162, 163, 164, 165, 166, 167, 168, 169, 170, 171, 181, 184, 185, 197, 199, 204, 205, 206, 216, 228, 229, 230, 273, 274, 275, 278, 279, 280, 290, 291, 292, 293, 296, 297, 298, 299, 300, 301, 302, 312, 315, 316, 317, 324, 325, 326, 365, 366, 367, 369, 375, 376, 377, 381, 386, 387, 388, 389, 390, 393, 396, 397, 471, 472, 483, 489, 492, 493, 563, 566, 567, 568, 569, 578, 579, 582, 585, 587, 589, 662, 664, 674, 675, 681, 684, 685, 755, 756, 760, 761, 765, 770, 771, 773, 778, 780, 781, 851, 855, 856, 857, 862, 866, 867, 869, 874, 876, 877, 947, 951, 952, 953, 958, 962, 963, 970, 972, 973, 1047, 1048, 1049, 1054, 1058, 1059, 1068, 1069, 1144, 1145, 1150, 1154, 1155, 1164, 1165, 1240, 1241, 1242, 1246, 1250, 1251, 1260, 1261, 1336, 1337, 1338, 1346, 1347, 1356, 1357, 1432, 1433, 1434, 1442, 1443, 1452, 1453, 1528, 1529, 1530, 1538, 1539, 1548, 1549, 1624, 1625, 1626, 1630, 1634, 1635, 1644, 1645, 1720, 1721, 1726, 1730, 1731, 1740, 1741, 1816, 1817, 1822, 1826, 1827, 1836, 1837, 1912, 1913, 1918, 1922, 1923, 1932, 1933, 2008, 2009, 2014, 2018, 2019, 2028, 2029, 2104, 2105, 2110, 2114, 2115, 2124, 2125, 2200, 2201, 2206, 2210, 2211, 2220, 2221, 2296, 2297, 2302, 2306, 2307, 2316, 2317, 2392, 2393, 2398, 2402, 2403, 2412, 2413, 2488, 2489, 2494, 2498, 2499, 2508, 2509, 2584, 2585, 2590, 2594, 2595, 2604, 2605, 2680, 2681, 2686, 2690, 2691, 2700, 2701, 2776, 2777, 2782, 2786, 2787, 2796, 2797, 2872, 2873, 2878, 2882, 2883, 2892, 2893, 2968, 2969, 2974, 2978, 2979, 2988, 2989, 3064, 3065, 3066, 3070, 3074, 3075, 3082, 3084, 3161, 3162, 3163, 3164, 3166, 3170, 3171, 3178, 3180, 3257, 3258, 3259, 3260, 3266, 3267, 3276, 3353, 3354, 3355, 3356, 3362, 3363, 3372, 3373, 3450, 3451, 3452, 3458, 3459, 3468, 3469, 3540, 3546, 3547, 3548, 3554, 3555, 3564, 3565, 3636, 3642, 3643, 3644, 3646, 3650, 3651, 3660, 3661, 3732, 3738, 3739, 3740, 3742, 3746, 3747, 3756, 3757, 3834, 3836, 3838, 3842, 3843, 3845, 3851, 3852, 3923, 3934, 3938, 3939, 3941, 3945, 3948, 3950, 4019, 4022, 4030, 4034, 4035, 4037, 4041, 4044, 4045, 4048, 4051, 4052, 4053, 4054, 4055, 4056, 4060, 4061, 4063, 4065, 4069, 4074, 4079, 4085, 4091, 4092, 4096, 4097, 4112, 4114, 4116, 4126, 4130, 4131, 4133, 4137, 4140, 4141, 4143, 4146, 4150, 4152, 4153, 4156, 4157, 4158, 4162, 4166, 4171, 4175, 4178, 4181, 4186, 4189, 4194, 4195, 4200, 4201, 4204, 4205, 4206, 4207, 4208, 4209, 4211, 4222, 4226, 4227, 4229, 4233, 4239, 4240, 4241, 4242, 4243, 4244, 4245, 4252, 4272, 4279, 4288, 4295, 4307, 4310, 4318, 4322, 4323, 4324, 4325, 4328, 4336, 4339, 4340, 4341, 4342, 4343, 4368, 4369, 4391, 4407, 4414, 4418, 4419, 4420, 4421, 4436, 4438, 4439, 4444, 4486, 4487, 4488, 4499, 4510, 4514, 4515, 4517, 4522, 4529, 4530, 4563, 4569, 4572, 4579, 4584, 4585, 4586, 4587, 4588, 4589, 4590, 4591, 4597, 4599, 4606, 4610, 4611, 4613, 4624, 4625, 4626, 4627, 4628, 4629, 4630, 4631, 4636, 4657, 4677, 4680, 4681, 4682, 4683, 4684, 4685, 4686, 4687, 4702, 4706, 4707, 4709, 4720, 4721, 4722, 4723, 4724, 4725, 4726, 4727, 4730, 4731, 4736, 4738, 4744, 4748, 4754, 4755, 4762, 4764, 4772, 4773, 4775, 4776, 4777, 4778, 4779, 4780, 4781, 4782, 4783, 4784, 4796, 4798, 4802, 4803, 4805, 4816, 4817, 4818, 4819, 4820, 4821, 4822, 4823, 4824, 4825, 4829, 4830, 4831, 4835, 4837, 4843, 4844, 4846, 4852, 4853, 4855, 4856, 4860, 4862, 4864, 4866, 4869, 4872, 4873, 4874, 4875, 4876, 4877, 4878, 4879, 4880, 4892, 4894, 4898, 4899, 4913, 4914, 4915, 4916, 4917, 4918, 4919, 4921, 4923, 4924, 4926, 4927, 4948, 4960, 4962, 4965, 4968, 4969, 4970, 4971, 4972, 4973, 4974, 4975, 4988, 4990, 4994, 4995, 5017, 5018, 5021, 5036, 5040, 5058, 5060, 5061, 5084, 5086, 5090, 5091, 5114, 5116, 5117, 5119, 5121, 5139, 5153, 5159, 5180, 5182, 5186, 5187, 5210, 5215, 5223, 5228, 5233, 5236, 5244, 5248, 5276, 5278, 5282, 5283, 5285, 5309, 5312, 5328, 5331, 5340, 5345, 5372, 5374, 5378, 5379, 5380, 5383, 5414, 5415, 5429, 5430, 5431, 5432, 5433, 5434, 5435, 5436, 5464, 5467, 5468, 5470, 5474, 5477, 5512, 5513, 5514, 5517, 5519, 5563, 5571, 5573, 5574, 5647, 5648, 5649, 5650, 5651, 5652, 5657, 5658, 5659, 5660, 5668, 5669, 5670, 5671, 5678, 5679, 5680, 5681, 5682, 5683, 5684, 5685, 5686, 5687, 5688, 5689, 5690, 5691, 5692, 5693, 5694, 5704, 5707, 5708, 5711, 5729, 5730, 5731, 5732, 5733, 5734, 5735, 5736, 5737, 5738, 5739, 5740, 5741, 5742, 5743, 5744, 5745, 5746, 5747, 5748, 5753, 5755, 5756, 5765, 5767, 5768, 5770, 5771, 5772, 5773, 5774, 5775, 5776, 5777, 5778, 5779, 5780, 5781, 5782, 5783, 5784, 5785, 5786, 5787, 5788, 5789, 5790, 5791, 5792, 5797, 5798, 5799, 5800, 5801, 5805, 5806, 5807, 5814, 5815, 5816, 5817, 5818, 5819, 5820, 5824, 5825, 5826, 5827, 5828, 5829, 5830, 5831, 5832, 5833, 5834, 5835, 5836, 5837, 5838, 5839, 5840, 5841, 5842, 5843, 5844, 5845, 5846, 5847, 5848, 5849, 5852, 5858, 5862, 5863, 5864, 5865, 5866, 5867, 5868, 5869, 5870, 5871, 5872, 5873, 5874, 5875, 5876, 5877, 5878, 5879, 5880, 5881, 5882, 5883, 5884, 5885, 5886, 5887, 5888, 5889, 5890, 5891, 5892, 5893, 5894, 5895, 5896, 5899, 5900, 5903, 5904, 5906, 5907, 5908, 5909, 5910, 5911, 5912, 5913, 5914, 5915, 5916, 5917, 5918, 5919, 5920, 5921, 5922, 5923, 5924, 5925, 5926, 5927, 5928, 5929, 5930, 5931, 5932, 5933, 5934, 5935, 5936, 5937, 5938, 5939, 5940, 5941, 5942, 5943, 5944, 5945, 5946, 5948, 5949: pixel_data <= 2080;
   100, 670, 3251, 3347, 3443, 4057, 4064, 4066, 4073, 4080, 4083, 4098, 4100, 4101, 4159, 4187, 4188, 4198, 4251, 4281, 4465, 4476, 4583, 4635, 4827, 4836, 4841, 4842, 4845, 4851, 4857, 4861, 4863, 4865, 4930, 4940, 5024, 5031, 5127, 5132, 5136, 5247, 5324, 5566, 5757, 5947: pixel_data <= 6306;
   101, 289, 382, 577, 1566, 3662, 3758, 3854, 3937, 3997, 4033, 4129, 4225, 4248, 4253, 4292, 4321, 4346, 4383, 4417, 4452, 4466, 4480, 4513, 4560, 4566, 4567, 4609, 4634, 4652, 4656, 4663, 4672, 4705, 4742, 4745, 4756, 4801, 4897, 4993, 5041, 5089, 5185, 5222, 5240, 5281, 5338, 5377, 5416, 5423, 5758, 5959, 5961, 5992, 5999, 6001, 6042, 6044: pixel_data <= 14759;
   102, 399, 574, 766, 4287, 4375, 4556, 5028, 5046, 5232, 5323, 5418, 5421, 5662, 6040: pixel_data <= 12613;
   110, 121, 124, 182, 183, 194, 198, 272, 285, 303, 318, 319, 368, 374, 398, 466, 470, 477, 482, 487, 580, 581, 588, 663, 665, 759, 1043, 1139, 1235, 1331, 1342, 1427, 1438, 1523, 1534, 1619, 1715, 1811, 1907, 2003, 2099, 2195, 2291, 2387, 2483, 2579, 2675, 2771, 2867, 2963, 3059, 3085, 3155, 3156, 3181, 3252, 3277, 3348, 3444, 3539, 3635, 3731, 3827, 3924, 4049, 4050, 4058, 4059, 4062, 4071, 4078, 4084, 4087, 4088, 4093, 4094, 4095, 4099, 4102, 4104, 4105, 4106, 4107, 4108, 4109, 4110, 4111, 4155, 4163, 4168, 4169, 4170, 4179, 4180, 4197, 4212, 4246, 4247, 4250, 4256, 4273, 4275, 4282, 4305, 4306, 4347, 4364, 4390, 4471, 4482, 4496, 4500, 4548, 4562, 4578, 4581, 4582, 4639, 4659, 4668, 4671, 4676, 4678, 4679, 4759, 4761, 4768, 4833, 4838, 4839, 4840, 4847, 4854, 4858, 4859, 4870, 4931, 4966, 5027, 5044, 5052, 5057, 5063, 5123, 5148, 5217, 5220, 5235, 5254, 5315, 5319, 5329, 5332, 5348, 5419, 5420, 5518, 5570, 5611, 5612, 5661, 5666, 5667, 5762, 5763, 5764, 5851, 5853, 5859, 5860, 5861, 5897, 5898, 5901, 5902: pixel_data <= 4160;
   120, 4082, 4089, 4090, 4103, 4113, 4182, 4348, 4387, 4483, 4580, 4749, 4751, 5124: pixel_data <= 8451;
   189, 494, 4261, 4356, 4384, 4460, 4848: pixel_data <= 10500;
   190, 754, 1138, 1234, 1286, 1307, 1308, 1330, 1382, 1383, 1391, 1404, 1426, 1522, 1575, 1615, 1618, 1675, 1714, 1810, 1862, 1866, 1906, 1962, 2002, 2052, 2074, 2098, 2194, 2290, 2386, 2482, 2541, 2578, 2637, 2674, 2733, 2734, 2770, 2866, 2962, 3031, 3058, 3154, 3250, 3301, 3346, 3442, 3538, 4016, 4254, 4265, 4274, 4456, 4648, 5147, 5953: pixel_data <= 23046;
   191, 591, 1303, 2266, 2738, 3870, 3986: pixel_data <= 44111;
   286, 463, 464, 946, 1042, 1212, 1287, 1478, 1479, 1494, 1574, 1579, 1671, 1766, 1770, 2638, 2731, 2917, 2923, 3025, 3397, 3634, 3730, 3826, 3974, 3988, 4018, 4249, 4284, 4743, 4746, 4956, 5227, 5242: pixel_data <= 20966;
   400, 401, 402, 403, 404, 405, 406, 407, 416, 417, 418, 419, 420, 421, 422, 423, 424, 425, 426, 427, 428, 429, 430, 431, 432, 433, 434, 435, 436, 437, 438, 439, 440, 441, 442, 443, 444, 445, 446, 447, 454, 455, 456, 457, 458, 459, 460, 461, 462, 465, 562, 658, 850, 1470, 1500, 1578, 1670, 1674, 1711, 2635, 2730, 2827, 2922, 3922, 4264, 4276, 4380, 4440, 4467, 4484, 4551, 4553, 4644, 4649, 4666, 4740, 4741, 4747, 4760, 4770, 4935, 4952, 5035, 5055, 5126, 5129, 5131, 5144, 5149, 5955, 6043: pixel_data <= 18886;
   497, 498, 499, 500, 505, 506, 507, 508, 509, 510, 511, 512, 513, 521, 522, 523, 524, 525, 526, 527, 531, 537, 555, 556, 557, 558, 687, 753, 1207, 1419, 1935, 2031, 2127, 2223, 2933, 2991, 3087, 3183, 3279, 3471, 3633, 3861, 3866, 3878, 3883, 3894, 3897, 3898, 3899, 3903, 3904, 3905, 4007, 4009, 4010, 4011, 4012, 4015: pixel_data <= 52368;
   504, 2538, 2540, 2633, 2737, 2921, 2930, 2939, 3537, 3860, 3863, 3867, 3875, 3876, 3886, 3887, 3890, 3900, 4001, 4008, 4013, 4014: pixel_data <= 54513;
   560, 656, 1086, 2537, 3902, 4002: pixel_data <= 46190;
   592, 630, 636, 655, 751, 807, 824, 835, 880, 890, 915, 934, 983, 986, 995, 1032, 1074, 1076, 1078, 1082, 1107, 1115, 1124, 1130, 1131, 1136, 1187, 1196, 1203, 1216, 1219, 1221, 1226, 1232, 1266, 1283, 1304, 1316, 1317, 1322, 1325, 1327, 1328, 1370, 1379, 1409, 1410, 1422, 1424, 1464, 1466, 1491, 1497, 1512, 1520, 1558, 1580, 1587, 1599, 1701, 1707, 1751, 1763, 1800, 1848, 1855, 1859, 1878, 1880, 1881, 1896, 1946, 1964, 1988, 2065, 2068, 2077, 2086, 2096, 2131, 2140, 2146, 2150, 2162, 2172, 2173, 2181, 2190, 2192, 2230, 2231, 2233, 2245, 2250, 2260, 2261, 2274, 2275, 2288, 2384, 2446, 2480, 2528, 2535, 2536, 2626, 2648, 2748, 2840, 2848, 3032, 3114, 3115, 3152, 3207, 3218, 3220, 3228, 3232, 3298, 3303, 3304, 3394, 3411, 3440, 3520, 3600, 3609, 3618, 3692, 3694, 3779, 3788, 3791, 3793, 3795, 3799, 3802, 3805, 3909, 3910, 3912, 3913, 3914, 3915, 3916, 3917: pixel_data <= 45801;
   593, 594, 595, 596, 608, 609, 610, 617, 618, 619, 623, 626, 627, 633, 692, 693, 694, 695, 696, 699, 700, 701, 702, 703, 707, 708, 709, 710, 711, 712, 720, 721, 724, 730, 731, 734, 741, 742, 743, 744, 745, 746, 747, 748, 749, 750, 803, 815, 832, 927, 976, 994, 1003, 1016, 1028, 1072, 1091, 1100, 1119, 1120, 1184, 1186, 1217, 1220, 1265, 1299, 1360, 1474, 1581, 1593, 1603, 1606, 1611, 1658, 1679, 1695, 1702, 1744, 1754, 1762, 1772, 1784, 1785, 1793, 1794, 1797, 1840, 1858, 1898, 1899, 1966, 1994, 2032, 2062, 2063, 2064, 2087, 2090, 2091, 2143, 2145, 2152, 2161, 2164, 2182, 2224, 2228, 2234, 2236, 2256, 2257, 2269, 2277, 2280, 2287, 2320, 2325, 2326, 2327, 2328, 2337, 2345, 2346, 2350, 2364, 2371, 2372, 2375, 2434, 2440, 2464, 2466, 2479, 2530, 2534, 2575, 2651, 2652, 2654, 2671, 2720, 2726, 2749, 2750, 2767, 2818, 2850, 2912, 2946, 2992, 3042, 3088, 3111, 3112, 3113, 3138, 3184, 3200, 3201, 3202, 3297, 3331, 3332, 3393, 3400, 3420, 3426, 3428, 3472, 3506, 3512, 3515, 3568, 3591, 3596, 3604, 3606, 3619, 3683, 3684, 3687, 3698, 3700, 3707, 3709, 3710, 3717, 3727, 3775, 3796, 3813, 3815, 3817, 3818, 3819, 3820: pixel_data <= 49863;
   597, 598, 599, 600, 601, 602, 603, 604, 605, 606, 607, 611, 612, 613, 614, 615, 616, 624, 625, 628, 629, 631, 632, 634, 635, 637, 638, 639, 640, 641, 642, 643, 644, 645, 646, 647, 648, 649, 650, 651, 652, 653, 654, 688, 725, 726, 727, 732, 733, 784, 785, 790, 795, 812, 813, 814, 818, 819, 833, 836, 838, 882, 908, 1002, 1005, 1007, 1011, 1017, 1025, 1112, 1113, 1114, 1195, 1197, 1215, 1361, 1395, 1407, 1456, 1458, 1475, 1485, 1496, 1509, 1514, 1552, 1554, 1559, 1561, 1571, 1583, 1594, 1600, 1605, 1608, 1610, 1649, 1650, 1654, 1656, 1667, 1676, 1689, 1690, 1691, 1704, 1706, 1752, 1792, 1796, 1803, 1842, 1850, 1856, 1868, 1879, 1892, 1893, 1936, 1992, 2034, 2035, 2045, 2057, 2060, 2069, 2142, 2144, 2153, 2165, 2185, 2191, 2232, 2242, 2262, 2268, 2270, 2276, 2278, 2279, 2286, 2363, 2383, 2416, 2456, 2512, 2558, 2576, 2608, 2625, 2656, 2672, 2704, 2744, 2752, 2768, 2800, 2823, 2846, 2864, 2896, 2960, 3015, 3056, 3136, 3211, 3219, 3248, 3280, 3306, 3324, 3330, 3344, 3376, 3402, 3403, 3410, 3412, 3419, 3495, 3502, 3516, 3598, 3608, 3615, 3616, 3664, 3714, 3761, 3762, 3763, 3764, 3765, 3766, 3767, 3768, 3769, 3770, 3771, 3772, 3773, 3774, 3780, 3787, 3790, 3801, 3803, 3804, 3810, 3811, 3823, 3911, 3918: pixel_data <= 47847;
   620, 621, 622, 690, 691, 697, 698, 704, 705, 706, 713, 714, 715, 719, 722, 723, 728, 729, 735, 736, 737, 738, 739, 740, 786, 800, 811, 881, 992, 993, 1004, 1029, 1088, 1122, 1123, 1125, 1170, 1185, 1264, 1282, 1376, 1378, 1457, 1553, 1560, 1562, 1568, 1570, 1582, 1592, 1601, 1602, 1604, 1655, 1666, 1688, 1696, 1697, 1698, 1700, 1745, 1746, 1760, 1795, 1802, 1841, 1857, 1938, 1965, 1967, 2044, 2056, 2061, 2093, 2128, 2130, 2141, 2151, 2156, 2160, 2189, 2227, 2235, 2238, 2239, 2240, 2241, 2247, 2251, 2252, 2253, 2282, 2285, 2323, 2324, 2329, 2330, 2331, 2332, 2333, 2334, 2335, 2336, 2349, 2365, 2370, 2373, 2374, 2376, 2377, 2382, 2420, 2421, 2430, 2431, 2432, 2467, 2470, 2471, 2472, 2473, 2478, 2526, 2527, 2562, 2568, 2574, 2609, 2622, 2623, 2624, 2670, 2719, 2721, 2754, 2766, 2810, 2811, 2856, 2857, 2863, 2903, 2904, 2905, 2906, 2907, 2908, 2951, 2952, 2953, 2959, 2998, 2999, 3000, 3001, 3002, 3003, 3004, 3009, 3055, 3151, 3210, 3234, 3247, 3287, 3288, 3289, 3290, 3291, 3292, 3293, 3294, 3295, 3305, 3343, 3391, 3401, 3427, 3430, 3435, 3436, 3439, 3489, 3490, 3498, 3499, 3507, 3508, 3517, 3522, 3524, 3526, 3535, 3595, 3602, 3612, 3613, 3620, 3631, 3665, 3666, 3667, 3668, 3669, 3670, 3671, 3672, 3673, 3682, 3691, 3695, 3708, 3715, 3716, 3722, 3723, 3776, 3777, 3785, 3786, 3812, 3814, 3816, 3821, 3822: pixel_data <= 51879;
   689, 716, 717, 718, 978, 1026, 1089, 1090, 1169, 1280, 1377, 1472, 1473, 1657, 1664, 1677, 1678, 1773, 1774, 1775, 1869, 1870, 1871, 1995, 2092, 2157, 2158, 2159, 2188, 2225, 2237, 2254, 2255, 2281, 2283, 2321, 2322, 2338, 2343, 2378, 2380, 2381, 2417, 2418, 2419, 2422, 2423, 2424, 2425, 2426, 2427, 2428, 2429, 2433, 2438, 2460, 2461, 2462, 2468, 2474, 2477, 2513, 2514, 2515, 2516, 2523, 2524, 2525, 2556, 2557, 2566, 2567, 2569, 2570, 2573, 2610, 2611, 2619, 2620, 2621, 2658, 2662, 2663, 2664, 2665, 2666, 2669, 2705, 2706, 2707, 2713, 2714, 2715, 2716, 2717, 2718, 2722, 2759, 2760, 2761, 2762, 2765, 2801, 2802, 2803, 2804, 2805, 2806, 2807, 2808, 2809, 2812, 2813, 2814, 2815, 2817, 2855, 2858, 2859, 2861, 2862, 2897, 2898, 2899, 2900, 2901, 2902, 2909, 2910, 2911, 2913, 2914, 2950, 2954, 2955, 2957, 2958, 2993, 2994, 2995, 2996, 2997, 3005, 3006, 3007, 3010, 3043, 3044, 3046, 3048, 3049, 3050, 3051, 3053, 3054, 3089, 3090, 3091, 3092, 3093, 3094, 3095, 3096, 3097, 3098, 3099, 3100, 3101, 3102, 3103, 3105, 3106, 3139, 3140, 3145, 3146, 3147, 3148, 3149, 3150, 3185, 3186, 3187, 3188, 3189, 3190, 3191, 3192, 3193, 3194, 3195, 3196, 3197, 3198, 3199, 3208, 3236, 3237, 3238, 3242, 3243, 3244, 3245, 3246, 3281, 3282, 3283, 3284, 3285, 3286, 3296, 3334, 3335, 3336, 3337, 3338, 3339, 3340, 3341, 3342, 3377, 3378, 3379, 3380, 3381, 3382, 3383, 3384, 3385, 3386, 3387, 3388, 3389, 3390, 3392, 3432, 3433, 3434, 3437, 3438, 3487, 3488, 3523, 3525, 3528, 3529, 3530, 3531, 3532, 3533, 3534, 3569, 3585, 3586, 3592, 3593, 3594, 3603, 3611, 3621, 3622, 3623, 3624, 3625, 3626, 3627, 3628, 3629, 3630, 3674, 3675, 3676, 3677, 3678, 3679, 3681, 3699, 3701, 3718, 3720, 3721, 3724, 3725, 3726, 3778, 3783, 3784: pixel_data <= 53893;
   752, 848, 939, 1111, 1175, 1270, 1971, 2643, 2725, 2739, 2845, 2942, 3800, 3969, 4005: pixel_data <= 39655;
   787, 789, 793, 794, 796, 798, 801, 802, 805, 809, 810, 817, 820, 821, 822, 825, 826, 827, 829, 830, 831, 834, 839, 840, 843, 883, 893, 904, 906, 916, 922, 926, 979, 985, 988, 996, 997, 1001, 1006, 1012, 1022, 1030, 1031, 1036, 1037, 1075, 1081, 1084, 1092, 1102, 1104, 1108, 1118, 1127, 1171, 1172, 1176, 1180, 1204, 1208, 1218, 1223, 1224, 1227, 1228, 1267, 1272, 1273, 1305, 1306, 1310, 1311, 1312, 1313, 1314, 1315, 1319, 1320, 1324, 1363, 1388, 1414, 1415, 1416, 1420, 1465, 1476, 1498, 1511, 1516, 1555, 1556, 1588, 1598, 1607, 1612, 1651, 1652, 1668, 1684, 1685, 1694, 1703, 1708, 1747, 1748, 1753, 1756, 1776, 1780, 1781, 1786, 1798, 1799, 1804, 1805, 1843, 1849, 1852, 1864, 1865, 1872, 1873, 1876, 1883, 1889, 1890, 1891, 1894, 1900, 1901, 1939, 1940, 1948, 1949, 1950, 1951, 1952, 1953, 1968, 1969, 1972, 1973, 1976, 1986, 1987, 1991, 1996, 1997, 2339, 2341, 2347, 2348, 2351, 2352, 2353, 2356, 2357, 2358, 2361, 2435, 2436, 2437, 2443, 2444, 2447, 2448, 2452, 2453, 2457, 2463, 2531, 2549, 2553, 2554, 2559, 2627, 2649, 2650, 2655, 2723, 2741, 2745, 2751, 2819, 2836, 2841, 2842, 2843, 2847, 2915, 2920, 2937, 2938, 2943, 3011, 3023, 3033, 3107, 3126, 3129, 3133, 3153, 3203, 3221, 3249, 3317, 3327, 3413, 3414, 3417, 3423, 3491, 3492, 3503, 3504, 3509, 3510, 3513, 3518, 3519, 3587, 3599, 3605, 3614, 3873, 3880, 3881, 3907: pixel_data <= 64845;
   788, 792, 797, 799, 808, 816, 841, 844, 905, 912, 935, 936, 980, 989, 1000, 1008, 1009, 1013, 1019, 1041, 1085, 1105, 1137, 1188, 1193, 1209, 1214, 1225, 1233, 1269, 1276, 1284, 1321, 1329, 1364, 1421, 1425, 1459, 1492, 1502, 1517, 1521, 1564, 1572, 1595, 1597, 1617, 1660, 1680, 1713, 1764, 1768, 1769, 1790, 1809, 1844, 1853, 1877, 1882, 1885, 1888, 1895, 1905, 1941, 1942, 1943, 1945, 1960, 1977, 1981, 1984, 2001, 2097, 2193, 2289, 2340, 2354, 2367, 2368, 2385, 2442, 2458, 2481, 2544, 2577, 2645, 2673, 2746, 2747, 2769, 2837, 2865, 2919, 2931, 2932, 2940, 2961, 3036, 3057, 3116, 3119, 3125, 3132, 3135, 3204, 3216, 3229, 3231, 3299, 3311, 3312, 3318, 3328, 3345, 3395, 3404, 3408, 3421, 3422, 3588, 3872: pixel_data <= 62731;
   791, 806, 842, 907, 984, 1018, 1040, 1080, 1101, 1198, 1231, 1372, 1408, 1413, 1508, 1519, 1616, 1648, 1683, 1687, 1712, 1750, 1808, 1846, 1904, 2000, 2147, 2155, 2183, 2229, 2244, 2258, 2264, 2267, 2272, 2548, 2552, 2560, 2727, 2926, 2936, 2944, 3034, 3040, 3123, 3124, 3307, 3315, 3316, 3323, 3399, 3536, 3632, 3728, 3760, 3781, 3789, 3792, 3794, 3797, 3806, 3807, 3808, 3809, 3908, 3919: pixel_data <= 43747;
   804, 823, 845, 894, 911, 913, 917, 923, 940, 945, 1096, 1099, 1109, 1128, 1132, 1177, 1181, 1192, 1201, 1271, 1300, 1318, 1369, 1380, 1396, 1402, 1589, 1661, 1672, 1693, 1777, 1787, 1789, 1887, 1944, 1954, 1961, 1974, 1975, 1978, 1979, 1983, 1985, 2355, 2362, 2454, 2532, 2550, 2630, 2640, 2646, 2820, 2831, 2835, 2927, 3039, 3108, 3120, 3212, 3215, 3321, 3407, 3441, 3879, 3882, 3891, 3892: pixel_data <= 60650;
   828, 944, 990, 1079, 1126, 1210, 1368, 1484, 1510, 1515, 1591, 1758, 1779, 1783, 1791, 1845, 1847, 2136, 2163, 2259, 2263, 2265, 2271, 2273, 2359, 2360, 2369, 3128, 3224, 3230, 3320, 3406, 3416, 3782, 3798, 3824, 3857, 3858: pixel_data <= 41733;
   837, 898, 928, 932, 1033, 1083, 1106, 1705, 1801, 1947, 2076, 2094, 2139, 2154, 2184, 2465, 2753, 2822, 3137, 3617, 3685, 3696, 3706: pixel_data <= 33024;
   846, 886, 887, 920, 921, 937, 943, 981, 987, 991, 998, 1015, 1034, 1077, 1098, 1103, 1178, 1194, 1274, 1279, 1411, 1412, 1417, 1423, 1471, 1506, 1518, 1567, 1659, 1682, 1755, 1782, 1970, 1980, 2036, 2043, 2048, 2050, 2055, 2066, 2067, 2070, 2071, 2072, 2073, 2082, 2084, 2088, 2095, 2133, 2135, 2148, 2166, 2174, 2178, 2445, 2551, 2632, 2641, 2647, 2830, 3014, 3026, 3035, 3038, 3110, 3134, 3214, 3322, 3418, 3494, 3511, 3712: pixel_data <= 29057;
   847, 903, 924, 938, 982, 1014, 1035, 1039, 1094, 1190, 1191, 1199, 1295, 1367, 1375, 1386, 1418, 1462, 1482, 1483, 1486, 1495, 1614, 1686, 1807, 1884, 1903, 1958, 1959, 1963, 1999, 2038, 2039, 2053, 2058, 2075, 2080, 2168, 2170, 2171, 2177, 2451, 2542, 2547, 2642, 2728, 2743, 2829, 2839, 2925, 2935, 3013, 3018, 3019, 3021, 3027, 3109, 3213, 3309, 3398: pixel_data <= 24832;
   849, 901, 1133, 1296, 1309, 1323, 1381, 1397, 1405, 1481, 1613, 1681, 1955, 1982, 2533, 2724, 2828, 2928, 3864, 3906: pixel_data <= 56657;
   884, 1097, 1174, 1401, 1886, 2449, 2834, 3029, 3325: pixel_data <= 65169;
   885, 942, 1020, 1663, 1771, 1867, 2078, 2081, 2450, 3127, 3217: pixel_data <= 22752;
   888, 2844, 3314, 3424: pixel_data <= 50150;
   891, 895, 896, 914, 929, 1010, 1023, 1087, 1129, 1179, 1202, 1298, 1463, 1467, 1490, 1503, 1504, 1505, 1507, 1513, 1557, 1563, 1609, 1653, 1749, 1851, 1897, 1998, 2040, 2047, 2049, 2059, 2132, 2137, 2138, 2149, 2179, 2455, 2459, 2555, 2561, 2849, 2918, 2945, 3041, 3130, 3227, 3233, 3589, 3590, 3601, 3693, 3697, 3702, 3705, 3711, 3713: pixel_data <= 31072;
   892, 925, 941, 1093, 1117, 1200, 1268, 1277, 1288, 1289, 1292, 1293, 1389, 1403, 1406, 1468, 1584, 1757, 1854, 1860, 1990, 2543, 2740, 2742, 2824, 3012, 3020, 3037, 3222, 3225, 3326, 3500, 3868, 3869, 3871, 3874, 4004, 4006: pixel_data <= 58603;
   897, 930, 1024, 1989, 1993, 2046, 2089, 2180, 2631, 2657, 3329, 3505, 3607, 3686, 3704: pixel_data <= 35104;
   899, 902, 933, 999, 1095, 1135, 1183, 1211, 1229, 1230, 1275, 1290, 1291, 1294, 1326, 1365, 1371, 1387, 1390, 1394, 1487, 1586, 1590, 1596, 1692, 1759, 1767, 1778, 1863, 2037, 2041, 2042, 2051, 2079, 2085, 2134, 2167, 2169, 2175, 2176, 2545, 2821, 3016, 3017, 3022, 3028, 3117, 3118, 3121, 3122, 3131, 3205, 3206, 3226, 3302, 3409, 3425, 3493, 3501, 3597, 3703: pixel_data <= 26848;
   900, 1460, 2644, 2941, 3729, 3825, 3856, 3889, 3893, 3968, 3977: pixel_data <= 48133;
   918, 1038, 1173, 1182, 1374, 2539, 3310, 3970, 3976: pixel_data <= 37636;
   1021, 1373, 1385, 1469, 1493, 1499, 1673, 2628, 2916, 3865: pixel_data <= 62962;
   1073, 1665, 1937, 2033, 2129, 2186, 2246, 2248, 2659, 2853, 2949, 3008, 3209, 3239, 3333, 3688: pixel_data <= 58184;
   1116, 1278, 1902, 3405: pixel_data <= 27074;
   1121, 1281, 1699, 1761, 2187, 2226, 2243, 2249, 2284, 2342, 2344, 2379, 2439, 2469, 2475, 2476, 2517, 2522, 2563, 2565, 2571, 2572, 2612, 2618, 2653, 2667, 2708, 2709, 2712, 2755, 2763, 2816, 2851, 2947, 3047, 3104, 3141, 3143, 3144, 3235, 3240, 3241, 3429, 3431, 3473, 3474, 3475, 3476, 3477, 3478, 3479, 3480, 3481, 3482, 3483, 3484, 3485, 3486, 3496, 3497, 3527, 3570, 3571, 3572, 3573, 3574, 3575, 3576, 3577, 3578, 3579, 3580, 3581, 3582, 3583, 3584, 3680, 3690, 3719: pixel_data <= 56136;
   1189, 1205, 1297, 1384, 1392, 1393, 1501, 1577, 1585, 1669, 1709, 1765, 2629, 2729, 2735, 2736, 2832, 2924, 2929, 3024, 3300, 3308, 3396, 3901: pixel_data <= 60878;
   1213, 1285, 1301, 1477, 1480, 1488, 1489, 1565, 1573, 1576, 1861, 1956, 2639, 2732, 2825, 2833, 2838, 2934, 3030: pixel_data <= 58834;
   1362, 2366, 2441, 2529: pixel_data <= 54152;
   1399, 4072, 4360, 4552: pixel_data <= 8192;
   1400, 1874, 2054, 3313, 3319: pixel_data <= 20544;
   1662, 1710, 2634, 6046: pixel_data <= 25121;
   2518, 2519, 2520, 2521, 2564, 2613, 2614, 2615, 2616, 2617, 2660, 2668, 2710, 2711, 2756, 2758, 2764, 2852, 2854, 2860, 2948, 2956, 3045, 3052, 3142: pixel_data <= 55910;
default : pixel_data <= 0;
endcase
end
endmodule

