# Adversarial review — batch 205

Mechanical (not human) re-extraction and cross-check of
PeninsulaSpecialDepreciationCostFloor5M against the pinned source. Reproducible
from committed bytes; NOT a human legal review. No approval field recorded;
legal review stays LEGAL_REVIEW_PENDING.

### PeninsulaSpecialDepreciationCostFloor5M.lean — 半島振興法不均一課税省令 第一条 第一項 第一号 ロ

BY-DESIGN / 照合 (CI attestation + evidence wiring follow in separate commits).

- 一次資料: 半島振興法第十七条の地方税の不均一課税に伴う措置が適用される場合等を定める省令
  (law 407M50000008016), revision 407M50000008016_20250401_507M60000008028.
- Source: data/raw/407M50000008016_20250401_507M60000008028.law.json.
- 独立再抽出: walked `law_full_text` to Article `Num=1`, `Paragraph#1`,
  `Item#1`, `Subitem1#2 (ロ)`, `Column#2`, `Sentence#1`; scoped article 1,429
  chars. Needle 「五百万円以上のもの」 occurs once in that scoped article.
  Sibling unit in the same article contains 五百万円 but NOT the full needle
  (a capital-adjustment parenthetical intervenes); a 附則 sibling lacks it.
- 数値: 「五百万」 = 5,000,000 (`int_to_kanji(5000000) == 五百万`;
  `matched_spellings({5000000}) == {'5000000':['五百万']}`);
  `clause_correspondence({5000000}, …)` True on "spec numerals / rate ratio".
- 境界: 「以上」 is INCLUSIVE — `eligible 4,999,999 = false`,
  `eligible 5,000,000 = true`, `eligible 5,000,001 = true`. Zero/small inputs
  are kernel-decided false. This is a monotonic ¥-amount eligibility floor,
  distinct from rate/cap/rounding/proration modules.
- 独立仕様: specFloor/specEligible use their own numeral; agreeFloor/agreeEligible
  are separate bridges (`rw`/`rfl`).
- 判定 (H/T/D/C/U): H（特別償却設備の取得価額五百万円以上が branch ロ の要件）,
  T（5,000,000, 五百万, bytes pinned）, D（rfl / decide）, C（scoped needle 一意、
  sibling cross-check 不合格、inclusive 境界、spec 独立性）,
  U（branch イ の資本額区分・租税特別措置法参照、計画期間・令和九年三月三十一日、
  二号・三号、一年以内の土地造成、実際の不均一課税の有無、附則施行日は非介入）。
- 本レビューは機械的であり、人間による法解釈・目視確認ではない
  (legal review remains LEGAL_REVIEW_PENDING)。
