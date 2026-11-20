# Mechanically generated independent review — batch 23

### TaxSavingsPenaltyCap.lean — 納税貯蓄組合法 第十四条

独立再抽出: a throwaway Python file (deleted afterwards) opened
data/raw/326AC1000000145_20211122_503AC0000000046.law.json directly, hashed its
bytes, walked law_full_text to select the single Article attr.Num="14", and
re-flattened / whitespace-normalised that scoped article. No doc-comment,
no transcription_audit.py and no impl/spec/test file was trusted as input.

H/T/D/C/U record (CONFIRMED unless marked BY-DESIGN):

- H（pin/hash）: T（hashlib.sha256 on raw JSON bytes + revision_info） → D（CONFIRMED: fc6c4ca152291c10c1218a62303a879195bfbbe95a056d0e264ee0315bbc4e2b; 38,542 bytes; law_id 326AC1000000145; law_revision_id 326AC1000000145_20211122_503AC0000000046; title 納税貯蓄組合法）.
- H（wrong article）: T（walk law_full_text, select Article attr.Num="14"） → D（CONFIRMED: exactly one Article Num=14, 223 normalised chars）.
- H（needle wrong）: T（norm(flat(article14)).count(needle_norm)） → D（CONFIRMED: verbatim 原文 occurs 1x in the scoped article; 「十万円以下」 present）.
- H（cap wrong）: T（decode 十万円 as 100,000 and 以下 as inclusive <=） → D（CONFIRMED: specPenaltyCap=100_000; impl penaltyCap=100_000; no other numeral modelled）.
- H（formula wrong）: T（recompute amount <= 100000 on the boundary grid） → D（CONFIRMED: 0→true, 1→true, 99,999→true, 100,000→true, 100,001→false）.
- H（spec circular）: T（read spec def bodies for impl identifiers） → D（CONFIRMED: specPenaltyCap/specWithin are independent; only agree* mentions impl）.
- H（boundary/decide）: T（recompute Nat saturation identity） → D（CONFIRMED: 100,000-100,000=0; 100,001-100,000=1; all examples are closed `by decide`）.

C（critical findings）: none.
U（unresolved scope）: offender categories 一〜三, the 第三条 / 第四条 / 第七条 /
第十二条 violations, and the 不正の方法 / 補助金 / 検査 facts are out of scope
— BY-DESIGN per the implementation header, not soundness defects.

判定: CONFIRMED / BY-DESIGN; 照合 against the pinned raw text passed on every H.
NOTE (MECHANICAL-NOT-HUMAN-REVIEW): this is a mechanical re-extraction and
arithmetic check, NOT a human legal review (LEGAL_REVIEW_PENDING).
