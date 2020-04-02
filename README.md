# PA-TCT (Path Integration Triangle Completion Task)

Data and code for "Path Integration in Large-Scale Space and with Novel Geometries: Comparing Vector Addition and Encoding-Error Models"

Use Main.R to read the processed data and recreate the main figures in the manuscript. 
The R folder holds functions used for plotting and analysis.
The Matlab folder includes functions for model fitting and simulations.

The processed data column index

Triangle_index    Triangle configurations represented but unique index numbers

Size              length of the unguided side

Angle.C/Angle.B/Angle.A       internal angles

Side.A_B/SideC_A/Side.B_C     length of sides

Total_size    perimeter 

Hand          left-handed or right-handed trial (turn left or right)

Vision        if the trial had vision

Type          triangle type

Angle.Type    triangle angle type

Full.Type     triangle type by each internal angle

duration      trial duration

Trial_number  trial number

subjID        subject number

subjposC_x    subject's final X position when reaching point C

subjposC_y    subject's final Y position when reaching point C

AC_angle      angle from point C to A

AC_dist       diastance from point C to A

SubjAC_angle  angle from subject's point C to point A

SubjAC_dist   distance from subject's point C to point A

DistError     subjects walked distance / SubjAC_dist

AngleError    subjects turned angle - SubjAC_angle

M1AE      Model 1 simulated angle errors

M1DE      Model 1 simulated distance errors

M2AE      Model 2 simulated angle errors

M2DE      Model 2 simulated distance errors

EEMAE     Encoding-Error Model simulated angle errors

EEMDE     Encoding-Error Model simulated distance errors

Additional framework and resources used not included here:

https://github.com/BrainVR/brainvr-unity-framework (Used to create the experiment)

https://github.com/BrainVR/brainvr-reader (Used to process raw data)

https://github.com/AnneCollins/TenSimpleRulesModeling (Modified example codes used for model validation)
