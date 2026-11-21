import json, subprocess
out = subprocess.run(
    ["gh", "api", "-X", "GET", "repos/Unjuno/japan-tax-law-lean/pulls",
     "-f", "state=open", "-f", "head=Unjuno:verify/turn55"],
    capture_output=True, check=True,
).stdout
data = json.loads(out)
print("count:", len(data))
for x in data:
    print(x["number"], x["state"], x["head"]["sha"], x["title"])
