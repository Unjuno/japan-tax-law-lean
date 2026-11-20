# Mechanically generated independent review — batch 21

### DisasterVictimIncomeLimit.lean — 322AC0000000175 art.2(1)

独立再抽出: throwaway Python read data/INVENTORY.json, hashed the pinned raw
JSON bytes, and walked law_full_text to select MainProvision → Article `Num=2`
→ Paragraph `Num=1`. No doc-comment and no transcription_audit.py was used;
every value below was recomputed, not transcribed.

H/T/D/C/U record:

- H（pin hash wrong）: T（hashlib.sha256 on raw bytes vs INVENTORY source_sha256） → D（CONFIRMED: C3BB5B0B…3F4E7EF, 86804 bytes）.
- H（wrong article / needle）: T（walk MainProvision, select Article Num=2, Paragraph Num=1 rows） → D（CONFIRMED: one MainProvision Article Num=2; needle 「合計所得金額が七百五十万円以下であるとき」 occurs 1× as an exact Sentence, middle row of 3）.
- H（numeral wrong）: T（decode sibling rows） → D（CONFIRMED: 七百五十万 = 7,500,000; rows ≤5M→全部, ≤7.5M→十分の五, >7.5M→十分の二・五; 千万円=10M is the separate eligibility ceiling）.
- H（formula wrong）: T（compare impl `≤` and spec formula to 以下） → D（CONFIRMED: impl incomeLimit=7_500_000, specIncomeLimit=7_500_000; inclusive 以下 = ≤; Nat truncated subtraction =0 iff ≤）.
- H（spec circular）: T（read Spec def bodies for impl identifiers） → D（CONFIRMED: specIncomeLimit is spec-local; specWithinIncomeLimit uses it; only agree_income_limit bridges to impl）.
- H（boundary / decide unsound）: T（recompute truncated Nat subtraction, saturating at 0） → D（CONFIRMED: n=0,1,13,5M,7,499,999,7,500,000 → ≤ true, sub=0; n=7,500,001 → false, sub=1; n=10,000,000 → false, sub=2,500,000; impl ↔ spec agree at all points）.
- H（axiom / sorry）: T（text read） → D（CONFIRMED: none present）.

C（critical findings）: none. The 7.5M clause is the 5/10 rate-bracket
predicate, not the eligibility ceiling (千万円/10M) — BY-DESIGN, declared in
the implementation header.

U（unresolved scope）: 合計所得金額 is defined in-row as 総所得金額 + 退職所得金額
+ 山林所得金額 (所得税法22条) but taken as an opaque caller-supplied Nat —
BY-DESIGN scope boundary, not a soundness defect.

判定: CONFIRMED / BY-DESIGN; 照合 against the pinned raw text passed on every H.
NOTE: this is a mechanical re-extraction and arithmetic check, NOT a human legal
review; 法律的解釈は未検証 (LEGAL_REVIEW_PENDING).
