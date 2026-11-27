# Adversarial review — cycle-172 施行日以後の適用（技術的検証のみ）

- 日付: 2026-11-27。位置づけ: 技術的な原文照合。**人間の法律的レビューではない。**
  法的レビューは `LEGAL_REVIEW_PENDING`。架空の承認記録は作成しない。
- 手法: 各法令の pinned raw JSON を直接走査し該当条文を独立再抽出。
- H/T/D/C/U: H=反証可能な仮説, T=検証手続, D=判定, C=競合する読み, U=未解決の不確実性。

### RealEstateAcquisitionAfterEnforcement.lean — 地方税法 art.15

- 独立再抽出: 「新法第七十三条の二十七の二の規定は、施行日以後において不動産を取得した場合について適用する。」
- 照合: 「施行日以后」を境界包含（`acquisitionDay >= enforcementDay`）として再記述。
- H: 施行日当日を除外した可能性。T: `applies 99 100 = false`, `100 100 = true`。
  D: BY-DESIGN / CONFIRMED 0。U: 暦換算・不動産取得の認定は未対応。

### InheritanceDemandAfterEnforcement.lean — 相続税法 art.18

- 独立再抽出: 「新相続税法第三十四条第八項の規定は、施行日以後にする国税通則法第三十七条の規定による督促について適用する。」
- 照合: 同じ境界包含を督促日に適用。
- H: 「以前」と取り違えた可能性。T: `applies 99 100 = false`, `101 100 = true`。
  D: BY-DESIGN / CONFIRMED 0。C: 根拠法令と適用事象（取得 vs 督促）が異なる別セル。
  U: 督促の効力・日付の暦換算は未対応。

## 結論

両モジュールは **fidelity-only** の技術的照合に留まる。
施行日・経過措置の未対応部分は各 UNIT に個別記録した。
「技術的検証済み / 形式化未完了 / 法的レビュー未完了」は分離したままである。
