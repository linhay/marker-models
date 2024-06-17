from huggingface_hub import hf_hub_download
hf_hub_download(repo_id="vikp/surya_layout2", resume_download=True, filename="config.json")
hf_hub_download(repo_id="vikp/surya_layout2", resume_download=True, filename="model.safetensors")
hf_hub_download(repo_id="vikp/surya_layout2", resume_download=True, filename="preprocessor_config.json")