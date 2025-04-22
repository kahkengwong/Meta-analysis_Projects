# Title: Meta-Analysis for Antiphospholipid Antibodies and Migraine/Dementia
# Author: Kah Keng Wong
# Date: Dec 2016
# The script uses the metafor package for meta-analysis and generates plots for various subgroups (e.g., adults, pediatrics, gender, migraine types).


#------------------------------------------------------------
# Section 1: Setup and Package Installation
#------------------------------------------------------------
# Install and load required packages
install.packages("xlsx")
install.packages("metafor")
install.packages("RColorBrewer")
library(xlsx)         # For reading Excel files
library(metafor)      # For meta-analysis
library(RColorBrewer) # For color palettes

# Base directory for migraine meta-analysis
base_dir <- "..." # The directory


#--------------------------------------------------------------------------------------------
# Section 2: Forest Plots for Single Antibodies (aCL, B2GP1, LA)
#--------------------------------------------------------------------------------------------
# aCL Random Effects Model
setwd(file.path(base_dir, "Forest_Single-antibody"))
aCLdata <- read.xlsx("R_Forest_aCL-only.xlsx", sheetName="Sheet1")
aCL <- escalc(measure="OR", ai=tpos, bi=tneg, ci=cpos, di=cneg, data=aCLdata)
aCLres <- rma(yi, vi, data=aCL, slab=paste(Authors))
pdf("aCL_Random_Forest.pdf", width=769/72, height=613/72) # Convert pixels to inches
forest(aCLres, atransf=exp, xlim=c(-11,20), showweights=TRUE, at=log(c(0.001, 0.01,0.1, 1,10,100,1000,10000)), refline=FALSE)
dev.off()

# aCL Fixed Effects Model
aCLresFE <- rma(yi, vi, data=aCL, slab=paste(Authors), method="FE")
pdf("aCL_Fixed_Forest.pdf", width=769/72, height=613/72)
forest(aCLresFE, atransf=exp, xlim=c(-11,20), showweights=TRUE, at=log(c(0.001, 0.01,0.1, 1,10,100,1000,10000)), refline=FALSE)
dev.off()

# B2GP1 Random Effects Model
B2GP1data <- read.xlsx("R_Forest_B2GP1-only.xlsx", sheetName="Sheet1")
B2GP1 <- escalc(measure="OR", ai=tpos, bi=tneg, ci=cpos, di=cneg, data=B2GP1data)
B2GP1res <- rma(yi, vi, data=B2GP1, slab=paste(Authors))
pdf("B2GP1_Random_Forest.pdf", width=769/72, height=613/72)
forest(B2GP1res, atransf=exp, xlim=c(-11,20), showweights=TRUE, at=log(c(0.001, 0.01,0.1, 1,10,100,1000,10000)), refline=FALSE)
dev.off()

# B2GP1 Fixed Effects Model (Note: Corrected data reference from aCL to B2GP1)
B2GP1resFE <- rma(yi, vi, data=B2GP1, slab=paste(Authors), method="FE")
pdf("B2GP1_Fixed_Forest.pdf", width=769/72, height=613/72)
forest(B2GP1resFE, atransf=exp, xlim=c(-11,20), showweights=TRUE, at=log(c(0.001, 0.01,0.1, 1,10,100,1000,10000)), refline=FALSE)
dev.off()

# LA Random Effects Model
LAdata <- read.xlsx("R_Forest_LA-only.xlsx", sheetName="Sheet1")
LA <- escalc(measure="OR", ai=tpos, bi=tneg, ci=cpos, di=cneg, data=LAdata)
LAres <- rma(yi, vi, data=LA, slab=paste(Authors))
pdf("LA_Random_Forest.pdf", width=769/72, height=613/72)
forest(LAres, atransf=exp, xlim=c(-16,22), showweights=TRUE, at=log(c(0.001, 0.01,0.1, 1,10,100,1000,10000)), refline=FALSE)
dev.off()

# LA Fixed Effects Model
LAresFE <- rma(yi, vi, data=LA, slab=paste(Authors), method="FE")
pdf("LA_Fixed_Forest.pdf", width=769/72, height=613/72)
forest(LAresFE, atransf=exp, xlim=c(-16,22), showweights=TRUE, at=log(c(0.001, 0.01,0.1, 1,10,100,1000,10000)), refline=FALSE)
dev.off()


#----------------------------------------------------------------------------------------------------------------
# Section 3: Subgroup Analysis - Adults and Pediatrics (aCL, B2GP1, LA)
#----------------------------------------------------------------------------------------------------------------
# aCL Random Effects Model (Adults)
aCLAdultsdata <- read.xlsx("R_Forest_aCL-only-Adults.xlsx", sheetName="Sheet1")
aCLAdults <- escalc(measure="OR", ai=tpos, bi=tneg, ci=cpos, di=cneg, data=aCLAdultsdata)
aCLAdultsres <- rma(yi, vi, data=aCLAdults, slab=paste(Authors))
pdf("aCL_Adults_Random_Forest.pdf", width=769/72, height=613/72)
forest(aCLAdultsres, atransf=exp, xlim=c(-11,20), showweights=TRUE, at=log(c(0.001, 0.01,0.1, 1,10,100,1000,10000)), refline=FALSE)
dev.off()

# aCL Fixed Effects Model (Adults)
aCLAdultsresFix <- rma(yi, vi, data=aCLAdults, slab=paste(Authors), method="FE")
pdf("aCL_Adults_Fixed_Forest.pdf", width=769/72, height=613/72)
forest(aCLAdultsresFix, atransf=exp, xlim=c(-11,20), showweights=TRUE, at=log(c(0.001, 0.01,0.1, 1,10,100,1000,10000)), refline=FALSE)
dev.off()

# aCL Random Effects Model (Pediatric)
aCLPediatricdata <- read.xlsx("R_Forest_aCL-only-Pediatric.xlsx", sheetName="Sheet1")
aCLPediatric <- escalc(measure="OR", ai=tpos, bi=tneg, ci=cpos, di=cneg, data=aCLPediatricdata)
aCLPediatricres <- rma(yi, vi, data=aCLPediatric, slab=paste(Authors))
pdf("aCL_Pediatric_Random_Forest.pdf", width=769/72, height=613/72)
forest(aCLPediatricres, atransf=exp, xlim=c(-11,20), showweights=TRUE, at=log(c(0.001, 0.01,0.1, 1,10,100,1000,10000)), refline=FALSE)
dev.off()
leave1out(aCLPediatricres) # Sensitivity analysis

# aCL Fixed Effects Model (Pediatric)
aCLPediatricresFix <- rma(yi, vi, data=aCLPediatric, slab=paste(Authors), method="FE")
pdf("aCL_Pediatric_Fixed_Forest.pdf", width=769/72, height=613/72)
forest(aCLPediatricresFix, atransf=exp, xlim=c(-11,20), showweights=TRUE, at=log(c(0.001, 0.01,0.1, 1,10,100,1000,10000)), refline=FALSE)
dev.off()

# B2GP1 Random Effects Model (Adults)
B2GP1Adultsdata <- read.xlsx("R_Forest_B2GP1-only-Adults.xlsx", sheetName="Sheet1")
B2GP1Adults <- escalc(measure="OR", ai=tpos, bi=tneg, ci=cpos, di=cneg, data=B2GP1Adultsdata)
B2GP1Adultsres <- rma(yi, vi, data=B2GP1Adults, slab=paste(Authors))
pdf("B2GP1_Adults_Random_Forest.pdf", width=769/72, height=613/72)
forest(B2GP1Adultsres, atransf=exp, xlim=c(-11,20), showweights=TRUE, at=log(c(0.001, 0.01,0.1, 1,10,100,1000,10000)), refline=FALSE)
dev.off()

# B2GP1 Fixed Effects Model (Adults)
B2GP1AdultsresFE <- rma(yi, vi, data=B2GP1Adults, slab=paste(Authors), method="FE")
pdf("B2GP1_Adults_Fixed_Forest.pdf", width=769/72, height=613/72)
forest(B2GP1AdultsresFE, atransf=exp, xlim=c(-11,20), showweights=TRUE, at=log(c(0.001, 0.01,0.1, 1,10,100,1000,10000)), refline=FALSE)
dev.off()

# LA Random Effects Model (Adults)
LAAdultsdata <- read.xlsx("R_Forest_LA-only-Adults.xlsx", sheetName="Sheet1")
LAAdults <- escalc(measure="OR", ai=tpos, bi=tneg, ci=cpos, di=cneg, data=LAAdultsdata)
LAAdultsres <- rma(yi, vi, data=LAAdults, slab=paste(Authors))
pdf("LA_Adults_Random_Forest.pdf", width=769/72, height=613/72)
forest(LAAdultsres, atransf=exp, xlim=c(-11,20), showweights=TRUE, at=log(c(0.001, 0.01,0.1, 1,10,100,1000,10000)), refline=FALSE)
dev.off()


#------------------------------------------------------------------------------------
# Section 4: Overall Migraine Meta-Analysis (n=13 Studies)
#------------------------------------------------------------------------------------
setwd(base_dir)
data2 <- read.xlsx("R_Forest_Plot_n=13.xlsx", sheetName="Sheet1")
dat2 <- escalc(measure="OR", ai=tpos, bi=tneg, ci=cpos, di=cneg, data=data2)
res2 <- rma(yi, vi, data=dat2, slab=paste(Authors))
pdf("Migraine_n13_Forest.pdf", width=7, height=7) # Default dimensions
forest(res2, atransf=exp, xlim=c(-11,20), ylim=c(-1.5,20), showweights=TRUE, at=log(c(0.01,0.1, 1,10,100,1000,10000)))
dev.off()


#----------------------------------------------------------------------------------------------------------------
# Section 5: Subgroup Analysis - Adults vs Pediatrics (Overall)
#----------------------------------------------------------------------------------------------------------------
setwd(file.path(base_dir, "Forest_Adult-Paediatric"))
# Adults
Adultsdata <- read.xlsx("R_Forest_Adults.xlsx", sheetName="Sheet1")
Adults <- escalc(measure="OR", ai=tpos, bi=tneg, ci=cpos, di=cneg, data=Adultsdata)
Adultsres <- rma(yi, vi, data=Adults, slab=paste(Authors))
pdf("Adults_Forest.pdf", width=769/72, height=613/72)
forest(Adultsres, atransf=exp, xlim=c(-11,20), showweights=TRUE, at=log(c(0.001, 0.01,0.1, 1,10,100,1000,10000)), refline=FALSE)
dev.off()

# Pediatrics
Paediatricdata <- read.xlsx("R_Forest_Paediatric.xlsx", sheetName="Sheet1")
Paediatric <- escalc(measure="OR", ai=tpos, bi=tneg, ci=cpos, di=cneg, data=Paediatricdata)
Paediatricres <- rma(yi, vi, data=Paediatric, slab=paste(Authors))
pdf("Paediatric_Forest.pdf", width=769/72, height=613/72)
forest(Paediatricres, atransf=exp, xlim=c(-11,20), showweights=TRUE, at=log(c(0.001, 0.01,0.1, 1,10,100,1000,10000)), refline=FALSE)
dev.off()


#--------------------------------------------------------
# Section 6: Subgroup Analysis - Gender
#--------------------------------------------------------
setwd(file.path(base_dir, "Forest_Gender"))
# Female
FemaleData <- read.xlsx("R_Forest_Female-aPLs.xlsx", sheetName="Sheet1")
Female <- escalc(measure="OR", ai=tpos, bi=tneg, ci=cpos, di=cneg, data=FemaleData)
FemaleRes <- rma(yi, vi, data=Female, slab=paste(Authors))
pdf("Female_Forest.pdf", width=769/72, height=613/72)
forest(FemaleRes, atransf=exp, xlim=c(-11,20), showweights=TRUE, at=log(c(0.001, 0.01,0.1, 1,10,100,1000,10000)), refline=FALSE)
dev.off()

# Male
MaleData <- read.xlsx("R_Forest_Male-aPLs.xlsx", sheetName="Sheet1")
Male <- escalc(measure="OR", ai=tpos, bi=tneg, ci=cpos, di=cneg, data=MaleData)
MaleRes <- rma(yi, vi, data=Male, slab=paste(Authors))
pdf("Male_Forest.pdf", width=769/72, height=613/72)
forest(MaleRes, atransf=exp, xlim=c(-11,20), showweights=TRUE, at=log(c(0.001, 0.01,0.1, 1,10,100,1000,10000)), refline=FALSE)
dev.off()


#--------------------------------------------------------
# Section 7: Subgroup Analysis - Migraine with Aura
#--------------------------------------------------------
setwd(file.path(base_dir, "Forest_Migraine"))
# MwA aCL
MwAaCLData <- read.xlsx("R_Forest_Plot_MwA-aCL.xlsx", sheetName="Sheet1")
MwAaCL <- escalc(measure="OR", ai=tpos, bi=tneg, ci=cpos, di=cneg, data=MwAaCLData)
MwAaCLRes <- rma(yi, vi, data=MwAaCL, slab=paste(Authors))
pdf("MwA_aCL_Forest.pdf", width=769/72, height=613/72)
forest(MwAaCLRes, atransf=exp, xlim=c(-11,20), showweights=TRUE, at=log(c(0.001, 0.01,0.1, 1,10,100,1000,10000)), refline=FALSE)
dev.off()

# MwA LA
MwALAData <- read.xlsx("R_Forest_Plot_MwA-LA.xlsx", sheetName="Sheet1")
MwALA <- escalc(measure="OR", ai=tpos, bi=tneg, ci=cpos, di=cneg, data=MwALAData)
MwALARes <- rma(yi, vi, data=MwALA, slab=paste(Authors))
pdf("MwA_LA_Forest.pdf", width=769/72, height=613/72)
forest(MwALARes, atransf=exp, xlim=c(-11,20), showweights=TRUE, at=log(c(0.001, 0.01,0.1, 1,10,100,1000,10000)), refline=FALSE)
dev.off()

# MwA B2GP1
MwAB2GP1Data <- read.xlsx("R_Forest_Plot_MwA-B2GP1.xlsx", sheetName="Sheet1")
MwAB2GP1 <- escalc(measure="OR", ai=tpos, bi=tneg, ci=cpos, di=cneg, data=MwAB2GP1Data)
MwAB2GP1Res <- rma(yi, vi, data=MwAB2GP1, slab=paste(Authors))
pdf("MwA_B2GP1_Forest.pdf", width=769/72, height=613/72)
forest(MwAB2GP1Res, atransf=exp, xlim=c(-11,20), showweights=TRUE, at=log(c(0.001, 0.01,0.1, 1,10,100,1000,10000)), refline=FALSE)
dev.off()

# MwA aPLs
MwAaPLsData <- read.xlsx("R_Forest_Plot_MwA-aPLs.xlsx", sheetName="Sheet1")
MwAaPLs <- escalc(measure="OR", ai=tpos, bi=tneg, ci=cpos, di=cneg, data=MwAaPLsData)
MwAaPLsRes <- rma(yi, vi, data=MwAaPLs, slab=paste(Authors))
pdf("MwA_aPLs_Forest.pdf", width=769/72, height=613/72)
forest(MwAaPLsRes, atransf=exp, xlim=c(-11,20), showweights=TRUE, at=log(c(0.001, 0.01,0.1, 1,10,100,1000,10000)), refline=FALSE)
dev.off()


#------------------------------------------------------------------------------------
# Section 8: Subgroup Analysis - Migraine without Aura
#------------------------------------------------------------------------------------
# MwoA aCL
MwoAaCLData <- read.xlsx("R_Forest_Plot_MwoA-aCL.xlsx", sheetName="Sheet1")
MwoAaCL <- escalc(measure="OR", ai=tpos, bi=tneg, ci=cpos, di=cneg, data=MwoAaCLData)
MwoAaCLRes <- rma(yi, vi, data=MwoAaCL, slab=paste(Authors))
pdf("MwoA_aCL_Forest.pdf", width=769/72, height=613/72)
forest(MwoAaCLRes, atransf=exp, xlim=c(-11,20), showweights=TRUE, at=log(c(0.001, 0.01,0.1, 1,10,100,1000,10000)), refline=FALSE)
dev.off()

# MwoA LA
MwoALAData <- read.xlsx("R_Forest_Plot_MwoA-LA.xlsx", sheetName="Sheet1")
MwoALA <- escalc(measure="OR", ai=tpos, bi=tneg, ci=cpos, di=cneg, data=MwoALAData)
MwoALARes <- rma(yi, vi, data=MwoALA, slab=paste(Authors))
pdf("MwoA_LA_Forest.pdf", width=769/72, height=613/72)
forest(MwoALARes, atransf=exp, xlim=c(-11,20), showweights=TRUE, at=log(c(0.001, 0.01,0.1, 1,10,100,1000,10000)), refline=FALSE)
dev.off()

# MwoA B2GP1
MwoAB2GP1Data <- read.xlsx("R_Forest_Plot_MwoA-B2GP1.xlsx", sheetName="Sheet1")
MwoAB2GP1 <- escalc(measure="OR", ai=tpos, bi=tneg, ci=cpos, di=cneg, data=MwoAB2GP1Data)
MwoAB2GP1Res <- rma(yi, vi, data=MwoAB2GP1, slab=paste(Authors))
pdf("MwoA_B2GP1_Forest.pdf", width=769/72, height=613/72)
forest(MwoAB2GP1Res, atransf=exp, xlim=c(-11,20), showweights=TRUE, at=log(c(0.001, 0.01,0.1, 1,10,100,1000,10000)), refline=FALSE)
dev.off()

# MwoA aPLs
MwoAaPLsData <- read.xlsx("R_Forest_Plot_MwoA-aPLs.xlsx", sheetName="Sheet1")
MwoAaPLs <- escalc(measure="OR", ai=tpos, bi=tneg, ci=cpos, di=cneg, data=MwoAaPLsData)
MwoAaPLsRes <- rma(yi, vi, data=MwoAaPLs, slab=paste(Authors))
pdf("MwoA_aPLs_Forest.pdf", width=769/72, height=613/72)
forest(MwoAaPLsRes, atransf=exp, xlim=c(-11,20), showweights=TRUE, at=log(c(0.001, 0.01,0.1, 1,10,100,1000,10000)), refline=FALSE)
dev.off()


#------------------------------------------------------------------------------------
# Section 9: Diagnostic Plots (L'Abbe and Funnel Plots)
#------------------------------------------------------------------------------------
setwd(file.path(base_dir, "Forest_Single-antibody"))
# L'Abbe Plots
dat <- rma(measure="OR", ai=tpos, bi=tneg, ci=cpos, di=cneg, data=aCLdata)
pdf("aCL_Labbe.pdf", width=7, height=7)
labbe(dat, labels="Authors", xlim=c(-5.01,0), ylim=c(-5,0))
dev.off()
pdf("aCL_Labbe_Exp.pdf", width=7, height=7)
labbe(dat, transf=exp)
dev.off()

dat <- rma(measure="OR", ai=tpos, bi=tneg, ci=cpos, di=cneg, data=LAdata)
pdf("LA_Labbe.pdf", width=7, height=7)
labbe(dat)
dev.off()

dat <- rma(measure="OR", ai=tpos, bi=tneg, ci=cpos, di=cneg, data=B2GP1data)
pdf("B2GP1_Labbe.pdf", width=7, height=7)
labbe(dat)
dev.off()

# Funnel Plots for aCL
pdf("aCL_Funnel.pdf", width=500/72, height=600/72)
funnel(aCLres)
dev.off()
pdf("aCL_Funnel_Styled.pdf", width=500/72, height=600/72)
funnel(aCLres, pch=21, back="white", hlines="gray", shade="#FFFFCC", refline=0)
dev.off()

# Trim and Fill for aCL
aCLres.tf <- trimfill(aCLres)
pdf("aCL_TrimFill_Funnel.pdf", width=500/72, height=600/72)
funnel(aCLres.tf)
dev.off()


#------------------------------------------------------------------------------------
# Section 10: Publication Bias Tests (Egger's Test)
#------------------------------------------------------------------------------------
# Classical Egger Test for aCL
regtest(aCLres, model="lm")

# Random/Mixed-Effects Egger Test for aCL
regtest(aCLres)
