#@ How to push your dataset to your hugging face repo

!pip install datasets
!pip install huggingface_hub

from huggingface_hub import login
from datasets import Dataset

login()

import pandas as pd

input = pd.read_csv("file.name") #Make sure to uplaod the file to current working directory use cd
input

dataset = Dataset.from_pandas(input)
dataset = dataset.train_test_split(test_size=0.2) #Not mandatory for test_size replace with train_size

print(dataset)

# Push the individual train and test datasets to the hub
dataset["train"].push_to_hub("ClumsyAahDeveloper/SampleDatas", split="train") 
dataset["test"].push_to_hub("ClumsyAahDeveloper/SampleDatas", split="test")

from datasets import load_dataset, DatasetDict

# Load the dataset
dataset = load_dataset("ClumsyAahDeveloper/SampleDatas")

# Convert to pandas DataFrame for easier viewing if needed
train_df = dataset['train'].to_pandas()
test_df = dataset['test'].to_pandas()

# Print the DataFrames
print("Train Dataset:\n", train_df)
print("\nTest Dataset:\n", test_df) 
