from pathlib import Path
import json
p = Path("data/verification_evidence.json")
raw = p.read_text(encoding="utf-8")
print("size:", len(raw))
print("head:", repr(raw[:120]))
print("markers <<<<:", raw.count("<<<<<<<"), "====:", raw.count("======="), ">>>>:", raw.count(">>>>>>>"))
try:
    d = json.loads(raw)
    print("VALID JSON, units:", len(d.get("units", {})))
except Exception as e:
    print("INVALID JSON:", e)
