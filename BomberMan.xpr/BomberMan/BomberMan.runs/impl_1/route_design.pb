
Q
Command: %s
53*	vivadotcl2 
route_design2default:defaultZ4-113h px� 
�
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2"
Implementation2default:default2
xc7a35t2default:defaultZ17-347h px� 
�
0Got license for feature '%s' and/or device '%s'
310*common2"
Implementation2default:default2
xc7a35t2default:defaultZ17-349h px� 
p
,Running DRC as a precondition to command %s
22*	vivadotcl2 
route_design2default:defaultZ4-22h px� 
P
Running DRC with %s threads
24*drc2
22default:defaultZ23-27h px� 
V
DRC finished with %s
79*	vivadotcl2
0 Errors2default:defaultZ4-198h px� 
e
BPlease refer to the DRC report (report_drc) for more information.
80*	vivadotclZ4-199h px� 
V

Starting %s Task
103*constraints2
Routing2default:defaultZ18-103h px� 
}
BMultithreading enabled for route_design using a maximum of %s CPUs17*	routeflow2
22default:defaultZ35-254h px� 
p

Phase %s%s
101*constraints2
1 2default:default2#
Build RT Design2default:defaultZ18-101h px� 
B
-Phase 1 Build RT Design | Checksum: 9f8c2e78
*commonh px� 
�

%s
*constraints2p
\Time (s): cpu = 00:00:18 ; elapsed = 00:00:51 . Memory (MB): peak = 1334.512 ; gain = 86.5312default:defaulth px� 
v

Phase %s%s
101*constraints2
2 2default:default2)
Router Initialization2default:defaultZ18-101h px� 
o

Phase %s%s
101*constraints2
2.1 2default:default2 
Create Timer2default:defaultZ18-101h px� 
A
,Phase 2.1 Create Timer | Checksum: 9f8c2e78
*commonh px� 
�

%s
*constraints2p
\Time (s): cpu = 00:00:18 ; elapsed = 00:00:52 . Memory (MB): peak = 1334.988 ; gain = 87.0082default:defaulth px� 
{

Phase %s%s
101*constraints2
2.2 2default:default2,
Fix Topology Constraints2default:defaultZ18-101h px� 
M
8Phase 2.2 Fix Topology Constraints | Checksum: 9f8c2e78
*commonh px� 
�

%s
*constraints2p
\Time (s): cpu = 00:00:18 ; elapsed = 00:00:52 . Memory (MB): peak = 1342.211 ; gain = 94.2302default:defaulth px� 
t

Phase %s%s
101*constraints2
2.3 2default:default2%
Pre Route Cleanup2default:defaultZ18-101h px� 
F
1Phase 2.3 Pre Route Cleanup | Checksum: 9f8c2e78
*commonh px� 
�

%s
*constraints2p
\Time (s): cpu = 00:00:18 ; elapsed = 00:00:52 . Memory (MB): peak = 1342.211 ; gain = 94.2302default:defaulth px� 
p

Phase %s%s
101*constraints2
2.4 2default:default2!
Update Timing2default:defaultZ18-101h px� 
B
-Phase 2.4 Update Timing | Checksum: 92a191f3
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:23 ; elapsed = 00:01:02 . Memory (MB): peak = 1364.133 ; gain = 116.1522default:defaulth px� 
�
Intermediate Timing Summary %s164*route2J
6| WNS=4.946  | TNS=0.000  | WHS=-0.067 | THS=-1.050 |
2default:defaultZ35-416h px� 
I
4Phase 2 Router Initialization | Checksum: 118e16bd0
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:24 ; elapsed = 00:01:03 . Memory (MB): peak = 1371.344 ; gain = 123.3632default:defaulth px� 
p

Phase %s%s
101*constraints2
3 2default:default2#
Initial Routing2default:defaultZ18-101h px� 
C
.Phase 3 Initial Routing | Checksum: 200127aaa
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:26 ; elapsed = 00:01:06 . Memory (MB): peak = 1371.723 ; gain = 123.7422default:defaulth px� 
s

Phase %s%s
101*constraints2
4 2default:default2&
Rip-up And Reroute2default:defaultZ18-101h px� 
u

Phase %s%s
101*constraints2
4.1 2default:default2&
Global Iteration 02default:defaultZ18-101h px� 
�
Intermediate Timing Summary %s164*route2J
6| WNS=4.600  | TNS=0.000  | WHS=N/A    | THS=N/A    |
2default:defaultZ35-416h px� 
H
3Phase 4.1 Global Iteration 0 | Checksum: 1b779183b
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:33 ; elapsed = 00:01:15 . Memory (MB): peak = 1371.723 ; gain = 123.7422default:defaulth px� 
F
1Phase 4 Rip-up And Reroute | Checksum: 1b779183b
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:33 ; elapsed = 00:01:15 . Memory (MB): peak = 1371.723 ; gain = 123.7422default:defaulth px� 
|

Phase %s%s
101*constraints2
5 2default:default2/
Delay and Skew Optimization2default:defaultZ18-101h px� 
p

Phase %s%s
101*constraints2
5.1 2default:default2!
Delay CleanUp2default:defaultZ18-101h px� 
C
.Phase 5.1 Delay CleanUp | Checksum: 1b779183b
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:33 ; elapsed = 00:01:15 . Memory (MB): peak = 1371.723 ; gain = 123.7422default:defaulth px� 
z

Phase %s%s
101*constraints2
5.2 2default:default2+
Clock Skew Optimization2default:defaultZ18-101h px� 
M
8Phase 5.2 Clock Skew Optimization | Checksum: 1b779183b
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:33 ; elapsed = 00:01:15 . Memory (MB): peak = 1371.723 ; gain = 123.7422default:defaulth px� 
O
:Phase 5 Delay and Skew Optimization | Checksum: 1b779183b
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:33 ; elapsed = 00:01:15 . Memory (MB): peak = 1371.723 ; gain = 123.7422default:defaulth px� 
n

Phase %s%s
101*constraints2
6 2default:default2!
Post Hold Fix2default:defaultZ18-101h px� 
p

Phase %s%s
101*constraints2
6.1 2default:default2!
Hold Fix Iter2default:defaultZ18-101h px� 
r

Phase %s%s
101*constraints2
6.1.1 2default:default2!
Update Timing2default:defaultZ18-101h px� 
E
0Phase 6.1.1 Update Timing | Checksum: 22970f041
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:33 ; elapsed = 00:01:16 . Memory (MB): peak = 1371.723 ; gain = 123.7422default:defaulth px� 
�
Intermediate Timing Summary %s164*route2J
6| WNS=4.694  | TNS=0.000  | WHS=0.095  | THS=0.000  |
2default:defaultZ35-416h px� 
C
.Phase 6.1 Hold Fix Iter | Checksum: 22970f041
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:33 ; elapsed = 00:01:16 . Memory (MB): peak = 1371.723 ; gain = 123.7422default:defaulth px� 
A
,Phase 6 Post Hold Fix | Checksum: 22970f041
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:33 ; elapsed = 00:01:16 . Memory (MB): peak = 1371.723 ; gain = 123.7422default:defaulth px� 
o

Phase %s%s
101*constraints2
7 2default:default2"
Route finalize2default:defaultZ18-101h px� 
B
-Phase 7 Route finalize | Checksum: 22970f041
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:34 ; elapsed = 00:01:16 . Memory (MB): peak = 1371.723 ; gain = 123.7422default:defaulth px� 
v

Phase %s%s
101*constraints2
8 2default:default2)
Verifying routed nets2default:defaultZ18-101h px� 
I
4Phase 8 Verifying routed nets | Checksum: 22970f041
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:34 ; elapsed = 00:01:16 . Memory (MB): peak = 1371.727 ; gain = 123.7462default:defaulth px� 
r

Phase %s%s
101*constraints2
9 2default:default2%
Depositing Routes2default:defaultZ18-101h px� 
E
0Phase 9 Depositing Routes | Checksum: 2209bac93
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:35 ; elapsed = 00:01:21 . Memory (MB): peak = 1371.727 ; gain = 123.7462default:defaulth px� 
t

Phase %s%s
101*constraints2
10 2default:default2&
Post Router Timing2default:defaultZ18-101h px� 
�
Estimated Timing Summary %s
57*route2J
6| WNS=4.694  | TNS=0.000  | WHS=0.095  | THS=0.000  |
2default:defaultZ35-57h px� 
�
�The final timing numbers are based on the router estimated timing analysis. For a complete and accurate timing signoff, please run report_timing_summary.
127*routeZ35-327h px� 
G
2Phase 10 Post Router Timing | Checksum: 2209bac93
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:35 ; elapsed = 00:01:21 . Memory (MB): peak = 1371.727 ; gain = 123.7462default:defaulth px� 
@
Router Completed Successfully
2*	routeflowZ35-16h px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:35 ; elapsed = 00:01:21 . Memory (MB): peak = 1371.727 ; gain = 123.7462default:defaulth px� 
Z
Releasing license: %s
83*common2"
Implementation2default:defaultZ17-83h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
642default:default2
02default:default2
02default:default2
02default:defaultZ4-41h px� 
^
%s completed successfully
29*	vivadotcl2 
route_design2default:defaultZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
route_design: 2default:default2
00:00:372default:default2
00:01:242default:default2
1371.7272default:default2
123.7462default:defaultZ17-268h px� 
H
&Writing timing data to binary archive.266*timingZ38-480h px� 
D
Writing placer database...
1603*designutilsZ20-1893h px� 
=
Writing XDEF routing.
211*designutilsZ20-211h px� 
J
#Writing XDEF routing logical nets.
209*designutilsZ20-209h px� 
J
#Writing XDEF routing special nets.
210*designutilsZ20-210h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2)
Write XDEF Complete: 2default:default2
00:00:062default:default2
00:00:032default:default2
1371.7272default:default2
0.0002default:defaultZ17-268h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2t
`C:/NUS/EE2026/EE2026/BomberMan.xpr/BomberMan/BomberMan.runs/impl_1/BomberGameTopLevel_routed.dcp2default:defaultZ17-1381h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2&
write_checkpoint: 2default:default2
00:00:082default:default2
00:00:072default:default2
1371.7272default:default2
0.0002default:defaultZ17-268h px� 
�
%s4*runtcl2�
�Executing : report_drc -file BomberGameTopLevel_drc_routed.rpt -pb BomberGameTopLevel_drc_routed.pb -rpx BomberGameTopLevel_drc_routed.rpx
2default:defaulth px� 
�
Command: %s
53*	vivadotcl2�
~report_drc -file BomberGameTopLevel_drc_routed.rpt -pb BomberGameTopLevel_drc_routed.pb -rpx BomberGameTopLevel_drc_routed.rpx2default:defaultZ4-113h px� 
P
Running DRC with %s threads
24*drc2
22default:defaultZ23-27h px� 
�
#The results of DRC are in file %s.
168*coretcl2�
dC:/NUS/EE2026/EE2026/BomberMan.xpr/BomberMan/BomberMan.runs/impl_1/BomberGameTopLevel_drc_routed.rptdC:/NUS/EE2026/EE2026/BomberMan.xpr/BomberMan/BomberMan.runs/impl_1/BomberGameTopLevel_drc_routed.rpt2default:default8Z2-168h px� 
\
%s completed successfully
29*	vivadotcl2

report_drc2default:defaultZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2 
report_drc: 2default:default2
00:00:062default:default2
00:00:072default:default2
1371.7272default:default2
0.0002default:defaultZ17-268h px� 
�
%s4*runtcl2�
�Executing : report_methodology -file BomberGameTopLevel_methodology_drc_routed.rpt -pb BomberGameTopLevel_methodology_drc_routed.pb -rpx BomberGameTopLevel_methodology_drc_routed.rpx
2default:defaulth px� 
�
Command: %s
53*	vivadotcl2�
�report_methodology -file BomberGameTopLevel_methodology_drc_routed.rpt -pb BomberGameTopLevel_methodology_drc_routed.pb -rpx BomberGameTopLevel_methodology_drc_routed.rpx2default:defaultZ4-113h px� 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px� 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px� 
Y
$Running Methodology with %s threads
74*drc2
22default:defaultZ23-133h px� 
�
2The results of Report Methodology are in file %s.
450*coretcl2�
pC:/NUS/EE2026/EE2026/BomberMan.xpr/BomberMan/BomberMan.runs/impl_1/BomberGameTopLevel_methodology_drc_routed.rptpC:/NUS/EE2026/EE2026/BomberMan.xpr/BomberMan/BomberMan.runs/impl_1/BomberGameTopLevel_methodology_drc_routed.rpt2default:default8Z2-1520h px� 
d
%s completed successfully
29*	vivadotcl2&
report_methodology2default:defaultZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2(
report_methodology: 2default:default2
00:00:082default:default2
00:00:102default:default2
1376.2972default:default2
4.5702default:defaultZ17-268h px� 
�
%s4*runtcl2�
�Executing : report_power -file BomberGameTopLevel_power_routed.rpt -pb BomberGameTopLevel_power_summary_routed.pb -rpx BomberGameTopLevel_power_routed.rpx
2default:defaulth px� 
�
Command: %s
53*	vivadotcl2�
�report_power -file BomberGameTopLevel_power_routed.rpt -pb BomberGameTopLevel_power_summary_routed.pb -rpx BomberGameTopLevel_power_routed.rpx2default:defaultZ4-113h px� 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px� 
K
,Running Vector-less Activity Propagation...
51*powerZ33-51h px� 
P
3
Finished Running Vector-less Activity Propagation
1*powerZ33-1h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
762default:default2
02default:default2
02default:default2
02default:defaultZ4-41h px� 
^
%s completed successfully
29*	vivadotcl2 
report_power2default:defaultZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
report_power: 2default:default2
00:00:092default:default2
00:00:122default:default2
1418.0122default:default2
41.7152default:defaultZ17-268h px� 
�
%s4*runtcl2�
qExecuting : report_route_status -file BomberGameTopLevel_route_status.rpt -pb BomberGameTopLevel_route_status.pb
2default:defaulth px� 
�
%s4*runtcl2�
�Executing : report_timing_summary -max_paths 10 -file BomberGameTopLevel_timing_summary_routed.rpt -pb BomberGameTopLevel_timing_summary_routed.pb -rpx BomberGameTopLevel_timing_summary_routed.rpx -warn_on_violation 
2default:defaulth px� 
�
UpdateTimingParams:%s.
91*timing2R
> Speed grade: -1, Delay Type: min_max, Timing Stage: Requireds2default:defaultZ38-91h px� 
|
CMultithreading enabled for timing update using a maximum of %s CPUs155*timing2
22default:defaultZ38-191h px� 
�
%s4*runtcl2o
[Executing : report_incremental_reuse -file BomberGameTopLevel_incremental_reuse_routed.rpt
2default:defaulth px� 
x
TNo incremental reuse to report, no incremental placement and routing data was found.278*	vivadotclZ4-545h px� 
�
%s4*runtcl2o
[Executing : report_clock_utilization -file BomberGameTopLevel_clock_utilization_routed.rpt
2default:defaulth px� 
�
%s4*runtcl2�
�Executing : report_bus_skew -warn_on_violation -file BomberGameTopLevel_bus_skew_routed.rpt -pb BomberGameTopLevel_bus_skew_routed.pb -rpx BomberGameTopLevel_bus_skew_routed.rpx
2default:defaulth px� 
�
UpdateTimingParams:%s.
91*timing2R
> Speed grade: -1, Delay Type: min_max, Timing Stage: Requireds2default:defaultZ38-91h px� 
|
CMultithreading enabled for timing update using a maximum of %s CPUs155*timing2
22default:defaultZ38-191h px� 


End Record