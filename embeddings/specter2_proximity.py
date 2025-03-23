
import torch
from transformers import AutoTokenizer
from adapters import AutoAdapterModel

class Specter2Proximity:
    def __init__(self):
        self.tokenizer = AutoTokenizer.from_pretrained('allenai/specter2_base')
        self.model = AutoAdapterModel.from_pretrained('allenai/specter2_base')
        self.model.load_adapter("allenai/specter2", source="hf", load_as="proximity", set_active=True)
    
    def generate_embeddings(self, paper):
        text = paper['title'] + self.tokenizer.sep_token + (paper.get('abstract') or '')
        inputs = self.tokenizer(
            text,
            padding=True, 
            truncation=True,
            return_tensors="pt",
            return_token_type_ids=False,
            max_length=512
        )
        
        with torch.no_grad():
            output = self.model(**inputs)
            embedding = output.last_hidden_state.mean(dim=1).squeeze()
            embedding = embedding.cpu().numpy().tolist()

        return embedding