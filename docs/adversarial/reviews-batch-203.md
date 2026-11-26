# Adversarial review — batch 203

Mechanical (not human) re-extraction and cross-check of SpecialTonSecurityEightTen
against the pinned source. Reproducible from committed bytes; NOT a human legal
review. No approval field recorded; legal review stays LEGAL_REVIEW_PENDING.

### SpecialTonSecurityEightTen.lean — 特別とん税法施行令 第三条 第一項

BY-DESIGN / 照合 (CI attestation + evidence wiring follow in separate commits).

- 一次資料: 特別とん税法施行令 (law 332CO0000000049), revision
  332CO0000000049_20201001_502CO0000000128.
- Source: data/raw/332CO0000000049_20201001_502CO0000000128.law.json.
- 独立再抽出: walked `law_full_text` to Article `Num=3`, `Paragraph#1`,
  `Sentence#1`; scoped article 337 chars. Needle
  「とん税額の八分の十に相当する特別とん税額をあわせて担保しなければならない。」
  occurs once in scoped article and once in the whole law. Sibling paragraph-2
  clause (準用) does not contain it.
- 数値: 「八」 = 8, 「十」 = 10 (`matched_spellings({8,10}) == {'8':['八'],'10':['十']}`);
  `clause_correspondence({8,10}, …)` True on "spec numerals / rate ratio in clause".
  Other kanji strings in the cell are law/article identifiers only.
- 率: 「八分の十」 = 10/8 = 5/4 (>1, improper fraction). The model keeps the
  exact times-denominator form `ton × 10` with denominator 8 and proves the
  5/4 identity; it introduces NO Nat truncation or floor because the clause
  states no rounding rule.
- 境界: 9/10/11 (numerator) and 7/8/9 (denominator) are kernel-decided;
  these are finite smoke checks, not a universal correctness claim.
- 独立仕様: specNum/specDen/specTimesDen use their own numerals; agree* are
  separate bridges (`rw`/`rfl`).
- 判定 (H/T/D/C/U): H（担保すべき特別とん税額＝とん税額×10/8）, T（8,10, 八, 十,
  bytes pinned）, D（rfl / decide）, C（scoped needle 一意、sibling negative、
  improper fraction 保持、spec 独立性）, U（担保物・保証人の区分、art.6/art.9(2)
  手続、とん税額の算定、2項準用、裁量的法的判断は非介入）。
- 本レビューは機械的であり、人間による法解釈・目視確認ではない
  (legal review remains LEGAL_REVIEW_PENDING)。
