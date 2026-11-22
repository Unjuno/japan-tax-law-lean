import subprocess, json
p = "data/verification_evidence.json"
out = subprocess.run(["git", "show", ":" + p], capture_output=True, text=True,
                     encoding="utf-8", errors="replace")
print("index size:", len(out.stdout), "rc:", out.returncode)
print("head:", repr(out.stdout[:120]))
print("markers <<<<:", out.stdout.count("<<<<<<<"))
try:
    d = json.loads(out.stdout)
    u = d.get("units", {})
    uid = "NORM|35c971a0758598e57593706d43c4732904e25dab80fb92770430a30ab0f83d3f"
    print("VALID JSON, units:", len(u), "my unit present:", uid in u)
except Exception as e:
    print("INVALID:", e)
