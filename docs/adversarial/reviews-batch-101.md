# Adversarial review — batch 101

## Scope

Mechanical (not human) re-extraction and cross-check of the pinned source
artifact for ForeignAssetPenaltyCap.lean and its independent Spec/Tests modules.
Every claim below is reproducible from committed bytes.

### ForeignAssetPenaltyCap.lean — 国外財産調書 第十条（一年以下・五十万円以下の罰則上限）

BY-DESIGN / CONFIRMED — 独立再抽出（一次資料）による照合・判定。

- 一次資料: 内国税の適正な課税の確保を図るための国外送金等に係る調書の提出等に関する法律 (law id 409AC0000000110), revision 409AC0000000110_20260812_508AC0000000064
- Source: data/raw/409AC0000000110_20260812_508AC0000000064.law.json
- SHA-256: b4440b62d96b6d2f0962a72c815ce075705da13530f625f1204d534313fc24ab (SHA-256 照合 OK; 独立再抽出で一致)
- Article Num: 10 (第十条). 独立再抽出で 1 structural hit、needle verbatim 1 箇所一致を照合。
- Needle verbatim in scoped Article 10:
  「正当な理由がなくて国外財産調書をその提出期限までに税務署長に提出しなかったときは、その違反行為をした者は、一年以下の拘禁刑又は五十万円以下の罰金に処する。」
- Statutory literals: 1 = 一（一年以下の拘禁刑, INCLUSIVE years <= 1）;
  50 = 五十（五十万円以下の罰金, INCLUSIVE manYen <= 50）. Both source-verified;
  independent spec defines {1, 50}; generator spec_literals() = {50} (it treats
  1 as structural); source_literals_verified({1,50}) True.
- 境界カテゴリ (>=3): threshold_below (0, 49), threshold_at (1, 50),
  threshold_above (2, 51) — all kernel-decided examples.
- 独立仕様: specImpCap / specFineCap / specImp / specFine / specPenalty defined
  without implementation identifiers; bridges are pure `unfold ... ; rfl` only
  (agreeImpCap, agreeFineCap, agreeImp, agreeFine, agreePenalty).
- 判定 (H/T/D/C/U): H（国外財産調書 第十条の二つの明示的数的上限）, T（1 = 一年, 50 = 五十万円; INCLUSIVE <=; bytes pinned by SHA-256）, D（rfl / by decide のみ、&& reduction）, C（needle verbatim, both literals source-verified, boundary categories complete, spec independence confirmed）, U（提出義務・手続・裁判・量刑は非介入、CAP 条件のみをモデル化）.
- H/T/D/C/U 判定は BY-DESIGN / CONFIRMED。
- 本レビューは機械的検出であり、人間による法解釈・目視確認ではない (mechanical, not human)。
