# Adversarial review — batch 221

Mechanical (not human) re-extraction and cross-check of
TreatyReportFiveYearRetention against the pinned source. Reproducible from
committed bytes; NOT a human legal review. No approval field recorded; legal
review stays LEGAL_REVIEW_PENDING.

### TreatyReportFiveYearRetention.lean — 租税条約等特例法 第十条の八 第二項

BY-DESIGN / 照合 (CI attestation + evidence wiring follow in separate commits).

- 一次資料: 租税条約等の実施に伴う特別措置に関する法律
  (law 344AC0000000046), revision 344AC0000000046_20260521_508AC0000000012.
- Source: data/raw/344AC0000000046_20260521_508AC0000000012.law.json.
- 独立再抽出: walked `law_full_text` to Article `Num=10_8`, `Paragraph#2`;
  scoped article 369 chars; needle occurs once in the scoped article and once in
  the pinned raw. The neighbouring art. 10_8 ¶1 is a negative control (no needle,
  no 五年間). A separate pin exists for this law's art. 13 only.
- 数値: 「五」 = 5 (`int_to_kanji(5) == '五'`, `kanji_variants(5) == ['五']`,
  `matched_spellings({5}, text) == {'5':['五']}`);
  `clause_correspondence` True. 五年間 appears exactly once in the scoped article.
- 計算: retention window starting the year AFTER the base year, five inclusive
  years: `withinRetentionPeriod b t = b+1 <= t && t <= b+5`. Kernel-decided:
  2020→false, 2021→true, 2023→true, 2025→true, 2026→false. Independent
  `startOffset = 1` makes the 翌年 relation explicit rather than hidden in Nat.
- Distinct pattern: year-offset retention window; not a day/month deadline.
- 独立仕様: specYears/specNext/specInPeriod independent; agree* use `rw`/`rfl`.
- 判定 (H/T/D/C/U): H（記録を翌年から五年間保存）, T（5, 五, bytes pinned）,
  D（rfl / decide）, C（scoped needle 一意、¶1 negative、翌年+五年境界、spec 独立性）,
  U（報告金融機関等の定義、特定取引・契約終了日の認定、省令で定める日・記録項目、
  1項の作成義務、罰則、他条・法的効果は非介入）。
- 本レビューは機械的であり、人間による法解釈・目視確認ではない
  (legal review remains LEGAL_REVIEW_PENDING)。
