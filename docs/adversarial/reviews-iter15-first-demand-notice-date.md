# Adversarial review — batch 212

Mechanical (not human) re-extraction and cross-check of FirstDemandNoticeDate
against the pinned source. Reproducible from committed bytes; NOT a human legal
review. No approval field recorded; legal review stays LEGAL_REVIEW_PENDING.

### FirstDemandNoticeDate.lean — 国税通則法施行令 第二十五条 第一項 第四号

BY-DESIGN / 照合 (CI attestation + evidence wiring follow in separate commits).

- 一次資料: 国税通則法施行令 (law 337CO0000000135), revision
  337CO0000000135_20260401_507CO0000000126.
- Source: data/raw/337CO0000000135_20260401_507CO0000000126.law.json.
- 独立再抽出: walked `law_full_text` to Article `Num=25`, `Paragraph#1`,
  `Item#4`, `Column#2`; scoped article 1,848 chars. Full unit text occurs once
  in the pinned raw; the short needle occurs once in the whole law and only in
  article 25 (sibling articles 23/24/26/27 negative).
- 数値: 「二」 = 2 (`matched_spellings({2}) == {'2':['二']}`);
  `clause_correspondence({2}, text, …)` True. Sole numeral in the unit.
- 計算: `repeatedNotices n = 2 <= n` (inclusive 以上); `noticeDate first rest =
  rest.foldl Nat.min first` selects 最初に発した日 (earliest issuance day).
  Kernel-decided: counts 1 false / 2 true / 3 true; dates [10]→10,
  [10,12]→10, [10,8]→8, [10,12,7]→7, [10,10]→10.
- 独立仕様: specThreshold/specRepeated/specEarliest independent; agree* use
  `rw`/`rfl`.
- 判定 (H/T/D/C/U): H（告知書を二回以上発した場合は最初の発行日を起算日とする）,
  T（2, 二, bytes pinned）, D（rfl / decide）, C（scoped needle 一意、sibling
  negative、threshold + earliest 境界、spec 独立性）, U（税目の特定、告知書の
  存在・有効性、延滞税率・期間 calculation、5号、他条は非介入）。
- 本レビューは機械的であり、人間による法解釈・目視確認ではない
  (legal review remains LEGAL_REVIEW_PENDING)。
