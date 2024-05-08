# CRONOS_Fao56_adjustment
![station](https://github.com/colediggins/CRONOS_Fao56_adjustment/assets/157746115/499ff41e-80f6-4a3f-8b91-73728625a375)

## Overview
This repository is to serve as the submittal of my semester project for the class "Soil Physics Theory" at Oklahoma State University. Over the course of this project I want to take in-field soil moisture data and use it to train an FAO 56 based model to effectively predict soil moisture in crop fields.

## Statement of Need
The Cropland Observatory Nodes (CRONOS) were developed as a joint venture between Oklahoma State University (OSU) and Kansas State university (KSU) as a new method of managing rainfed croplands across the american plains. These stations are eqquipped with three systems:

- A cosmic-ray neutron detector collected a distance- and depth-weighted soil volumetric water content (CRS1000,Hydroinnova).
-  A downward-facing camera took RGB images which were processed with Canopeo to record green canopy cover (Range Cam 4G, Barn Owl).
-  All-in-one weather stations were used to measure many atmospheric variables (ClimaVue50, Campbell Scientific).

## Objectives

The combination of these three sensor types allows us to monitor a mutitude of values along the plant-soil-atmosphere continum. However the data these stations produce is only applicable for the time of collection and cant be used to make predictions of croping systems in their current state. Using this repository I aim to use python implementation of fao56 to model out a wheat cropping season and compare it with known data. After correction I then hope to use the fao56 model to estimate crop water use for a winter wheat season in central Oklahoma.

## Key Features


## Installation

This repository was generated using Python 3.7.

## Examples

- <!--[https://soilwater.github.io/crnpy/examples/stationary/example_RDT_station/](Processing and analyzing data from a stationary detector)-->
- <!--[https://soilwater.github.io/crnpy/examples/rover/Hydroinnova_rover_example/](Processing and analyzing data from a roving detector)-->
- <!--[https://soilwater.github.io/crnpy/examples/calibration/calibration/](Device-specific field calibration)-->

## Authors
The library was developed at the Olahoma State University Soil Physics Lab by:

- Cole Diggins

### Contributing
This is not a final product so be aware contributions should be minimal.

### Reporting Issues
If you encounter any issues or problems with the software, please report them to **TBD**
