import io

# 1) model: tolerate reversed deleted range
p = r'C:\Users\junny\Desktop\japan-tax-law-lean\scripts\law_audit\model.py'
s = io.open(p, encoding='utf-8').read()

old = '''    num_attr = num_attr.strip()
    if ":" in num_attr:
        a, b = num_attr.split(":", 1)
        start, end = int(a), int(b)
        if end < start:
            raise ValueError(f"invalid article range {num_attr!r}")
        return [ArticleKey(i, None) for i in range(start, end + 1)]'''
new = '''    num_attr = num_attr.strip()
    if ":" in num_attr:
        a, b = num_attr.split(":", 1)
        start, end = int(a), int(b)
        if end < start:
            # tolerate reversed placeholder; the audit reports it via STRUCT.DELETED.RANGE
            return [ArticleKey(start, None), ArticleKey(end, None)]
        return [ArticleKey(i, None) for i in range(start, end + 1)]'''
assert s.count(old) == 1
s = s.replace(old, new)
io.open(p, 'w', encoding='utf-8').write(s)

# 2) structural mutation test: MUT-10 against synthetic law
p2 = r'C:\Users\junny\Desktop\japan-tax-law-lean\scripts\tests\test_mutation_injection.py'
s = io.open(p2, encoding='utf-8').read()
old = '''    # MUT-10: reference to a nonexistent supplementary-provision article
    def test_mut10_nonexistent_supplementary_reference(self):
        def mutator(data):
            replaced = [0]
            for sent in walk(data["law_full_text"], lambda n: n.get("tag") == "Sentence"):
                if replaced[0]:
                    break
                for i, child in enumerate(sent.get("children", [])):
                    if isinstance(child, str) and "附則第三条" in child:
                        sent["children"][i] = child.replace("附則第三条", "附則第九百九十七条", 1)
                        replaced[0] = 1
                        break
            self.assertTrue(replaced[0])
        findings, stats, ids = self._audit(mutator)
        self.assertIn("REF.SUPP.MISSING", ids)'''
new = '''    # MUT-10: reference to a nonexistent supplementary-provision article (synthetic)
    def test_mut10_nonexistent_supplementary_reference(self):
        import tempfile
        import shutil
        from scripts.tests.test_structural_audit import make_synthetic_law

        tmp = Path(tempfile.mkdtemp(prefix="law-audit-mut10-"))
        try:
            path = make_synthetic_law(tmp)
            data = json.loads(path.read_bytes())
            replaced = [0]
            for sent in walk(data["law_full_text"], lambda n: n.get("tag") == "Sentence"):
                if replaced[0]:
                    break
                for i, child in enumerate(sent.get("children", [])):
                    if isinstance(child, str) and "同法の規定によるものとする" in child:
                        sent["children"][i] = "このテストは、附則第九条の規定によるものとする。"
                        replaced[0] = 1
                        break
            self.assertTrue(replaced[0])
            path.write_text(json.dumps(data, ensure_ascii=False), encoding="utf-8")
            findings, stats = all_findings(load_law(path), {})
            ids = [f.rule_id for f in findings]
            self.assertIn("REF.SUPP.MISSING", ids)
        finally:
            shutil.rmtree(tmp, ignore_errors=True)'''
assert s.count(old) == 1
s = s.replace(old, new)
io.open(p2, 'w', encoding='utf-8').write(s)
print('mut fix done')
