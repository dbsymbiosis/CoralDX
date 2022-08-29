# CoralDX
CoralDX: An image processing framework for extracting coral nibbins from a photo.<br />
This repo walks you through how we prepare, train and run CoralDX detector in the Cloud through Roboflow and Google Colab.<br />
![1_VluiXEpyenaqzuBkhtY3iA](https://user-images.githubusercontent.com/99760789/156474636-36180a09-8a37-4bbd-b76f-e8dd3e680ec1.jpeg)
YOLOv4 is a computer vision model for optimal speed and accuracy of object detection.<br />

## Prepare dataset for training
Before training custom detector, we need to prepare a dataset with annotations to provide your target areas to the model. Here, we utilized online annotation tool from the Roboflow which no needs to download and easy to use and save datasets: https://roboflow.com/annotate <br />
The dataset need to be as versatile as you can. For CoralDX, we utilized 40 pictures in images folder to train. And after annotating, the Roboflow will give a corresponding .txt file with the coordinates of your selected target areas.<br />

#### 1. Get started<br />
#### 2. Create new project (name it)<br />
#### 3. Annotate (group and name)<br />
To annotate, use the second square tool in right white bar to square the target area, then group and name every target areas. <br />
NOTE: Annotations are CASE SENSITIVE, so label all images used for training a model with the exact same labels. <br />
Annotation sample:![ed8f7710c01f4b22005a57eb09dc4ef](https://user-images.githubusercontent.com/99760789/156478377-41172c87-93b7-42b7-a5ca-9a9d479a781e.png)<br />
#### 4. Assign<br />
Assign images into train and valid datasets which are for training and validing the custom detector in 80%:20% ratio.<br />
![f0a4936550ebb131a5cf985d230dd0c](https://user-images.githubusercontent.com/99760789/156479422-732e1d7b-d7c1-45d2-9d44-8ffe5ba7e78e.png)<br />
#### 5. Generate dataset<br />
To generate dataset, in preprocessing section. We resized images in 416* 416 which can accelerate the training before downing annotated dataset: <br />
![32fff1758cb5304017ab60be2cb7dec](https://user-images.githubusercontent.com/99760789/156482596-06d385ad-003d-489d-b997-52949351b6c9.png)  <br /> <br />
For Augmentation, press Continue. <br /> 
While generating dataset, your screen will look like this: <br />
![generating loading screen](https://user-images.githubusercontent.com/77503347/187273187-eb2118a2-51c9-40f8-9a73-6462a6a67ee0.png)<br />
#### 6. Export and Download <br />
After generating the dataset, click on the 'Export' option to export and download your dataset. <br /> 
![export option](https://user-images.githubusercontent.com/77503347/187275314-c8182d0c-86e7-4909-84a3-7854014dcf5b.jpeg) <br /> 

Download the zipped dataset includes all images and related .txt files like shown in images folder: ![9d7e3ded18702bbafbc578ca574cb30](https://user-images.githubusercontent.com/99760789/156482401-83e1e3f8-ffbe-4194-bb4d-89a36f65fbbb.png)<br />


## Train custom detector in Google Colab
[![Train Custom Model In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/drive/1_GdoqCJWXsChrOiY8sZMr_zbr_fH-0Fg?usp=sharing) Before start the journey, make a copy of this Colab file.
1. Enabling GPU within your notebook<br />
![d0d318308b8a04ba3a94d1ec327a3c7](https://user-images.githubusercontent.com/99760789/156487290-dd54f88f-1572-4df2-b004-7e634db5da36.png)
2. Cloning and Building Darknet<br />
![258e8e97c2ab3f8861b6bc6730b8291](https://user-images.githubusercontent.com/99760789/156487412-6400bfd3-1d38-436b-adba-bb933de8d56c.png)
3. Download pre-trained YOLOv4 weights<br />
![95b5950256875de9b8c8237f77b7194](https://user-images.githubusercontent.com/99760789/156487627-c606e03f-76d3-43fb-8731-fc182e6d09e1.png)
4. Define Helper Functions<br />
![201a368b6de66408c48dcc2d70825ad](https://user-images.githubusercontent.com/99760789/156487936-21a80d11-d28b-4c7b-9328-95ccc5e1e872.png)
5. Run Your Detections with Darknet and YOLOv4!<br />
![9366cf94f1b88e48147cb28657518ca](https://user-images.githubusercontent.com/99760789/156488011-5de69ac2-70f8-4a4d-81ab-bbe8636a0b9e.png)
6. Uploading Local or Google Drive Files to Use<br />
We recommend to create a Google Drive Folder called yolov4 and put enerything into Google Drive for use<br />
![6151825886ad39a3a628dc2449877fc](https://user-images.githubusercontent.com/99760789/156489104-b819ae2d-acbc-4e14-b72d-410f21aff1ea.png)<br />
The follwing list is the files need to upload into the Googlr Drive<br />
![df1eb079741e20d8bb341fbc6a7d2cf](https://user-images.githubusercontent.com/99760789/156489897-54d35a04-f711-444f-b662-4a42236a288a.png)<br />
Copy of YOLOv4.ipynb: copy of this Colab tutorial file<br />
images: images for test custom detector<br />
backup: create empty folder to store weights file<br />
obj.zip: change name of train folder to obj and compress<br />
test.zip: change name of valid folder to test and compress<br />
![13395d487ed5d8a7a537eb924252d64](https://user-images.githubusercontent.com/99760789/156493447-8e4e6f70-2fe6-4c84-a86f-036e7acfc8fa.png)<br />
yolov4-obj.cfg: configuration file<br />
![1ebdf19dc1b69652f6bc676f18fff58](https://user-images.githubusercontent.com/99760789/156493594-80522aa9-17d9-42bc-99f3-01adbc6494c5.png)<br />
obj.names: group names<br />
obj.data: directions of files<br />
Put group names in obj.names file and change the classes number for custom detector. Both file can be editedd from example files using Text Editor in cfg section.<br />
![3cd74b5b0b69b4fcd2297129bdbbed5](https://user-images.githubusercontent.com/99760789/156494828-17330600-7c08-44a0-a69e-e15771ad17d0.png)<br />
generate_train.py: configuration files to train our custom detector are the train.txt training images<br />
generate_test.py: configuration files to train our custom detector are the test.txt testing images<br />
![b58c4c568501705e3c31a3fa9d3d08d](https://user-images.githubusercontent.com/99760789/156495019-189c595f-f90f-41cc-80f0-4813498eb7fb.png)
classes.txt: group names<br />
Edit example file using Text Editor and put group names in.<br />
7. Start training<br />
![image](https://user-images.githubusercontent.com/99760789/156896712-82ebdbd1-cbc9-4d06-ad85-4af8ee86c634.png)<br />

## Deploy .weights file into the Tensorflow
Download Tensorflow folder to local drive. We recommend to use Gitbash shell to deliver command and visual studio code as editor.<br />
1. Set up Conda environment<br />
We recommend to download Anaconda to set up tensorflow environment. Then deliver command in Gitbash shell to create and activate GPU or CPU.<br />

Tensorflow CPU<br />
conda env create -f conda-cpu.yml<br />
conda activate yolov4-cpu<br />

Tensorflow GPU<br />
conda env create -f conda-gpu.yml<br />
conda activate yolov4-gpu<br />

2. Download 'yolov4-obj_best.weights' file from backup folder.<br />

3. Use custom trained detector<br />

Copy and paste your custom .weights file into the 'data' folder and copy and paste your custom .names into the 'data/classes/' folder.<br />

The only change within the code you need to make in order for your custom model to work is on line 14 of 'core/config.py' file. Update the code to point at your custom .names file as seen below. (my custom .names file is called custom.names but yours might be named differently)<br />
![image](https://user-images.githubusercontent.com/99760789/156898001-df800ec3-0478-44ad-8ffc-82f9b6f14920.png)<br />

4. Convert yolov4 detector to Tensorflow detector<br />
python save_model.py --weights ./data/yolov4.weights --output ./checkpoints/yolov4-416 --input_size 416 --model yolov4 <br />
Paste this command into Gitbash.<br />

5. Crop and save target areas as new images<br />
python detect.py --weights ./checkpoints/yolov4-416 --size 416 --model yolov4 --images ./data/images/'your image name'.jpg --crop<br />
Imput this command into Gitbash, make sure replace'your image name' to your image name.<br />
6. Do image processing and measure RGB values in Matlab.<br />
Use .m MATLAB file to do image processing and measure cropped images, make sure to use correct directory and the number of coral nubbins.<br />
![de01834f872134cce6ef3820606da09](https://user-images.githubusercontent.com/99760789/156899525-77d99b42-bcf5-4b9f-9b9d-f53f4dffe82c.png)<br />
Image processing is utilizing the edge detection and a series of dialation, holes filling, border clear, erosion to isolate coral nubbin from background.<br />

7. Test CoralDX.<br />
Predict, predict and crop images.<br />
![image](https://user-images.githubusercontent.com/99760789/156899597-8c5b9665-24f5-4e42-9424-8d7ded514d67.png)<br />
Do image processing and measure RGB values.<br />
Image processing.<br />
![5b76de5198d7668c3860f0bd3d7c7b2](https://user-images.githubusercontent.com/99760789/156899961-15b90d2a-9e05-44aa-9c69-777e92b25b9d.png)<br />
![e215d9ba0543684abf87a006bf4dbd9](https://user-images.githubusercontent.com/99760789/156899964-c4916941-4e51-4f61-a5a1-6c884bfcb8a1.png)<br />
![3fc6f4c5e624136da29e80bbcf76913](https://user-images.githubusercontent.com/99760789/156899965-8b3d606c-14e8-4074-bc0b-06f119009b85.png)<br />
![4dbf338ef4102c689bd9d3dbbbf359a](https://user-images.githubusercontent.com/99760789/156899967-bada78d7-be4b-4368-9e13-4ab35ac99d35.png)<br />
![d4050fa685dc16955b0a83b417c2c79](https://user-images.githubusercontent.com/99760789/156899968-05e50b00-0b69-411d-b80c-ada511409d32.png)<br />
![94dea1d50060a1a7625780d74c517cd](https://user-images.githubusercontent.com/99760789/156899997-baed4341-359c-49f0-9589-13df38572cc8.png)<br />
![7c3c3de3e8b9ee9551dbc1f157eadfc](https://user-images.githubusercontent.com/99760789/156899971-65dab5f8-3632-4d07-9bbb-381fbd339bf6.png)<br />
MATLAB will give R, G, and B values for coral nubbins and color blocks.<br />
![image](https://user-images.githubusercontent.com/99760789/156899646-31c10662-3b3c-4511-9136-b73df2240391.png)<br />




























