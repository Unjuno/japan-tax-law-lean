# Adversarial review — batch 211

Mechanical (not human) re-extraction and cross-check of
SpecialCorpBusinessTaxZeroFloor against the pinned source. Reproducible from
committed bytes; NOT a human legal review. No approval field recorded; legal
review stays LEGAL_REVIEW_PENDING.

### SpecialCorpBusinessTaxZeroFloor.lean — 特別法人事業税施行令 附則第二条 第一項 第一号

BY-DESIGN / 照合 (CI attestation + evidence wiring follow in separate commits).

- 一次資料: 特別法人事業税及び特別法人事業譲与税に関する法律施行令
  (law 431CO0000000089), revision 431CO0000000089_20240401_506CO0000000012.
- Source: data/raw/431CO0000000089_20240401_506CO0000000012.law.json.
- 独立再抽出: walked `law_full_text` to the SUPPLEMENTARY article `Num=2`
  (`SupplProvision[2]`), `Paragraph#1`, `Item#1`, `Column#2`; scoped article
  1,547 chars. The short parenthetical 「零を下回る場合には、零とする。」
  recurs four times in that article, but the FULL unit leaf occurs once in
  this cell and not in its sibling Column#1 condition cell.
- 数値: 「零」 = 0 (`matched_spellings({0}) == {'0':['零']}`); the only numeral
  in the cell is 零 (twice, same literal). Evidence uses the pinned-needle
  anchor since `spec_literals` treats 0 as structural.
- 計算: `netAmount p r = p - r` on Nat is zero-saturating, matching
  「零を下回る場合には、零とする」. Kernel-decided: 100−40=60, 40−100=0,
  50−50=0, 0−0=0, 1−2=0.
- This is a distinct law/revision/cell pin of the clamp-at-zero pattern
  (also pinned for 印紙税法 art.12 in `ClampedSubtraction`); no novelty claim.
- 独立仕様: specNet is independent; agreeNet is a separate rfl bridge.
- 判定 (H/T/D/C/U): H（払込予定額−還付金等、零下回れば零）, T（0, 零, bytes
  pinned）, D（rfl / decide）, C（full-leaf 一意、sibling negative、zero
  saturation、spec 独立性）, U（払込予定額・還付金等の算定、2号の下回る額、
  2項旧地方法人特別税、他条、法的効果・手続は非介入）。
- 本レビューは機械的であり、人間による法解釈・目視確認ではない
  (legal review remains LEGAL_REVIEW_PENDING)。
