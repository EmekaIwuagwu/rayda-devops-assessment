from fastapi import FastAPI
from pydantic import BaseModel
from datetime import datetime

app = FastAPI()

items = []

class Item(BaseModel):
    name: str
    description: str = None

@app.get("/health")
async def health_check():
    return {"status": "healthy", "timestamp": datetime.utcnow().isoformat() + "Z"}

@app.get("/items")
async def get_items():
    return {"items": items}

@app.post("/items")
async def create_item(item: Item):
    items.append(item.dict())
    return {"message": "Item created", "item": item}
