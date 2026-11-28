# Adversarial review — batch 217

Mechanical (not human) re-extraction and cross-check of
LocalGasolineGuaranteeRatio44Of243 against the pinned source. Reproducible from
committed bytes; NOT a human legal review. No approval field recorded; legal
review stays LEGAL_REVIEW_PENDING.

### LocalGasolineGuaranteeRatio44Of243.lean — 地方揮発油税法施行令 第一条 第一項

BY-DESIGN / 照合 (CI attestation + evidence wiring follow in separate commits).

- 一次資料: 地方揮発油税法施行令 (law 330CO0000000151), revision
  330CO0000000151_20241001_506CO0000000148.
- Source: data/raw/330CO0000000151_20241001_506CO0000000148.law.json.
- 独立再抽出: walked `law_full_text` to the MAIN Article `Num=1` (three same-
  numbered 附則 articles exist; the long needle disambiguates), `Paragraph#1`;
  scoped article 290 chars, needle occurs once. Sibling Article 2 contains
  neither the needle nor either kanji numeral (negative control).
- 数値: one statutory rule, the fraction 二百四十三分の四十四 = 44/243;
  `matched_spellings({243,44}, scoped) == {'44':['四十四'], '243':['二百四十三']}`;
  `clause_correspondence` True. Structural labels (第八条第一項, 昭和三十二年
  法律第五十五号, etc.) are not counted as substantive numerals.
- 計算: exact proper-fraction proportional multiplier, no rounding stated.
  Kernel-decided on Nat: gcd(44,243)=1 (coprime), 44<243 (proper), and exact
  cross-multiplied relations at 0 / 243→44 / 486→88. Rat value is a
  declaration only; no tactic beyond `decide` is used.
- Distinct pattern: proper fraction 44/243; the analogous pinned module
  `SpecialTonSecurityEightTen` uses the improper fraction 10/8.
- 独立仕様: specNum/specDen independent; agree* use `rfl`/`decide`.
- 判定 (H/T/D/C/U): H（担保は揮発油税額の44/243に相当する地方揮発油税額を併せて担保）,
  T（44, 243, 四十四, 二百四十三, bytes pinned）, D（rfl / decide on cross-products）,
  C（main-vs-附則 disambiguation、sibling negative、coprime/proper/exact relations、
  spec 独立性）, U（担保提供者の特定、揮発油税額の算定、担保物・保証人の分類、
  手続、円未満端数、2条、附則、法的効果は非介入）。
- 本レビューは機械的であり、人間による法解釈・目視確認ではない
  (legal review remains LEGAL_REVIEW_PENDING)。
