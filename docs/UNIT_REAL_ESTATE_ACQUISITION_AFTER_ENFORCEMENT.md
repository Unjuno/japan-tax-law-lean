# UNIT — RealEstateAcquisitionAfterEnforcement（地方税法 art.15 施行日以後の不動産取得）

- status: 技術的検証待ち（CI attestation 未 binding）; 法的レビュー: `LEGAL_REVIEW_PENDING`
- law `325AC0000000226` / rev `325AC0000000226_20261101_508AC0000000002`
- 原文「新法第七十三条の二十七の二の規定は、施行日以後において不動産を取得した場合について適用する。」
- 実装/独立仕様/境界: `RealEstateAcquisitionAfterEnforcement{,Spec,Tests}.lean`
- 独立レビュー: `docs/adversarial/reviews-cycle172-enforcement-date.md`
- 範囲: `acquisitionDay >= enforcementDay` の境界判定のみ。
- 未対応（別記録）: 施行日自体の確定、暦換算、不動産取得の認定。
