# UNIT — StandingTimberDeferredRate30（相続税法施行令 art.28 §1）

- status: 技術的検証待ち（CI attestation 未 binding）; 法的レビュー: `LEGAL_REVIEW_PENDING`
- law_id: `325CO0000000071`
- revision: `325CO0000000071_20260401_506CO0000000143`
- source: `data/raw/325CO0000000071_20260401_506CO0000000143.law.json`
- 対象 norm unit: `NORM|da73c38b5d7c6e1c6b529ef2b2072d90e68a61edbda6c60b22c5f513040cc5a0`
  `.../Article:28/Paragraph#1/ParagraphSentence/Sentence#1`（政令で定める割合 30%）
- 原文逐語: 「法第五十二条第一項第一号ロに規定する政令で定める割合は、百分の三十とする。」
- 独立仕様: `JapanTaxLaw/StandingTimberDeferredRate30Spec.lean`
- 実装: `JapanTaxLaw/StandingTimberDeferredRate30.lean`
- 境界: `JapanTaxLaw/StandingTimberDeferredRate30Tests.lean`（0 / 1 / 29,30,31 / 99,100,101）
- 独立レビュー: `docs/adversarial/reviews-cycle114-shares.md`

## 対象範囲（一部の計算可能な規則のみ）

対象は政令で定める割合 `30/100` の適用のみ。
同条 §2 の「立木の価額が占める割合を乗じて算定した税額との少ない額の選択」、
§3 の準用、延納許可・物納・申告手続は **未対応**。
本ユニットは条文全体の形式化を主張しない。

## H/T/D/C/U

- H: §1 の率を §2 の比較計算と混同した可能性。
- T: §1/§2 を別々に再抽出し、Spec に比較式がないことを確認。
- D: BY-DESIGN / CONFIRMED 0（技術的照合のみ）。
- C: 3/10 と 30/100 は同値だが丸め順序の解釈があり得る（両者とも Nat の切り捨てに統一）。
- U: §2 以降は未対応。法的レビューは未実施。
