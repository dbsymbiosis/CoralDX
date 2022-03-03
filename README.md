# CoralDX
CoralDX: An image processing framework for extracting coral nibbins from a photo.<br />
This repo walks you through how we prepare, train and run CoralDX detector in the Cloud through Google Colab.<br />
![1_VluiXEpyenaqzuBkhtY3iA](https://user-images.githubusercontent.com/99760789/156474636-36180a09-8a37-4bbd-b76f-e8dd3e680ec1.jpeg)
YOLOv4 is a computer vision model for optimal speed and accuracy of object detection.<br />

## Prepare dataset for training
Before training custom detector, we need to prepare a dataset with annotations to provide your target areas to the model. Here, we utilized online annotation tool from the Roboflow which no needs to download and easy to use and save datasets: https://roboflow.com/annotate <br />
The dataset need to be as versatile as you can. For CoralDX, we utilized 40 pictures in images folder to train. And after annotating, the Roboflow will give a corresponding .txt file with the coordinates of your selected target areas.<br />

1. Get started<br />
2. Create new project (name it)<br />
3. Annotate (group and name)<br />
Annotation sample:![ed8f7710c01f4b22005a57eb09dc4ef](https://user-images.githubusercontent.com/99760789/156478377-41172c87-93b7-42b7-a5ca-9a9d479a781e.png)<br />
To annotate, use the second square tool in right white bar to square the target area, then group and name every target areas. <br />
4. Assign<br />
Assign images into train and valid datasets which are for training and validing the custom detector in 80%:20% ratio.<br />
![f0a4936550ebb131a5cf985d230dd0c](https://user-images.githubusercontent.com/99760789/156479422-732e1d7b-d7c1-45d2-9d44-8ffe5ba7e78e.png)<br />
5. Generate dataset<br />
To generate dataset, in preprocessing section. We resized images in 416* 416 which can accelerate the training before downing annotated <br />
dataset: <br />
![32fff1758cb5304017ab60be2cb7dec](https://user-images.githubusercontent.com/99760789/156482596-06d385ad-003d-489d-b997-52949351b6c9.png)  <br /> 
6. Download <br />
Download the zipped dataset includes all images and related .txt files like shown in images folder: ![9d7e3ded18702bbafbc578ca574cb30](https://user-images.githubusercontent.com/99760789/156482401-83e1e3f8-ffbe-4194-bb4d-89a36f65fbbb.png)<br />


## Train custom detector in Google Colab
