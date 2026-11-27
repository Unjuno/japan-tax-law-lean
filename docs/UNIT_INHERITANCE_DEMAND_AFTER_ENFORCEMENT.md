# UNIT — InheritanceDemandAfterEnforcement（相続税法 art.18 施行日以後の督促）

- status: 技術的検証待ち（CI attestation 未 binding）; 法的レビュー: `LEGAL_REVIEW_PENDING`
- law `325AC0000000073` / rev `325AC0000000073_20260401_506AC0000000008`
- 原文「新相続税法第三十四条第八項の規定は、施行日以後にする国税通則法第三十七条の規定による督促について適用する。」
- 実装/独立仕様/境界: `InheritanceDemandAfterEnforcement{,Spec,Tests}.lean`
- 独立レビュー: `docs/adversarial/reviews-cycle172-enforcement-date.md`
- 範囲: `demandDay >= enforcementDay` の境界判定のみ。
- 未対応（別記録）: 施行日自体の確定、暦換算、督促の効力。
