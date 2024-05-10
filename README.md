# CRONOS_Fao56_adjustment
<img src="https://github.com/colediggins/CRONOS_Fao56_adjustment/assets/157746115/499ff41e-80f6-4a3f-8b91-73728625a375.jpg" width="250" height="250">

This repository is to serve as the submittal of my semester project for the class "Soil Physics Theory" at Oklahoma State University. Over the course of this project I want to take in-field soil moisture data and use it to train an FAO 56 based model to effectively predict soil moisture in crop fields.

## Statement of Need
The Cropland Observatory Nodes (CRONOS) were developed as a joint venture between Oklahoma State University (OSU) and Kansas State university (KSU) as a new method of managing rainfed croplands across the American plains. These stations are equipped with three systems:

- A cosmic-ray neutron detector collected a distance- and depth-weighted soil volumetric water content (CRS1000,Hydroinnova).
-  A downward-facing camera took RGB images which were processed with Canopeo to record green canopy cover (Range Cam 4G, Barn Owl).
-  All-in-one weather stations were used to measure many atmospheric variables (ClimaVue50, Campbell Scientific).
<img src="https://github.com/colediggins/CRONOS_Fao56_adjustment/blob/main/images/CRONOS_gen3.jpg" width="250" height="250">

## Objectives

The combination of these three sensor types allows us to monitor a multitude of values along the plant-soil-atmosphere continuum. However the data these stations produce is only applicable for the time of collection and can't be used to make predictions of cropping systems in their current state. Using this repository I aim to use python implementation of fao56 to model out a wheat cropping season and compare it with known data. After correction I then hope to use the fao56 model to estimate crop water use for a winter wheat season in central Oklahoma.

## Site Location
The research site the CRONOS station was deployed on is located on the Oklahoma State Research Center in Chickasha Oklahoma.
<img src="https://github.com/colediggins/CRONOS_Fao56_adjustment/assets/157746115/13f0db07-6e95-4b37-ba16-e47b30226d83.jpg" width="250" height="250">


## Key Features
The key features of this Repository are as follows:

- The preprocessed data of the CRONOS stations via Matlab
- An attempt to utilize said data in the Fao 56 model which was eventually a failure however some of the site parameters were input and used.
- a showing of how the Fao56 could be used and through ome of the machine learning concepts outlined using AI, possibly trained using known data, we would possibly be able to automate predicted ET of the soil.
- A proof of concept on AI and where it stands in the coding and modeling world

## Takeaways
- Relative humidity and barometric pressure cannot be used, exclusively, to predict the total neutron counts
- Going forward it would be nice to implement some of Joaquin's code to compare some other basic elements and use them in modeling predictions
- I have learned a lot of Python in this class and I look forward to the opportunity to apply this to everyday life

## Background

This repository was generated using Python 3.7.

## Examples

- This code can be found in the Juypter notebook "FAO56_CRONOS.ipynb"

## Authors
The library was developed at the Oklahoma State University Soil Physics Lab by:

- Cole Diggins

### Contributing
This is not a final product so be aware contributions should be minimal.

### Reporting Issues
If you encounter any issues or problems with the software, please report them to **TBD**
