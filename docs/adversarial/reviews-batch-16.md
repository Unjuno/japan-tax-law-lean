# Adversarial Review — Batch 16（独立機械クロスチェック）

- レビュー日: 2026-11-21 / 役割: Adversarial Review Agent（形式化担当から独立）。**機械的独立照合であり人間の法解釈レビューではない。**
- 手法: doc-comment / `transcription_audit.py` は不信。pinned raw JSON の `law_full_text` を自前 Python（使い捨て `D:\CodexData\Temp\opencode\_adv16_*.py`, 実行後削除）で再帰平坦化し `Article` を `attr.Num` で定位、U+3000／空白を正規化して原文リテラルを抽出。pinned 原文から導いた整数式を独立再実装し `by decide`／`rfl` 期待値と照合。本環境に `lake`／`lean` なくカーネル再実行は未実施。

### ExcellentLandTransferSpecialTax.lean — 租税特別措置法 第三十一条の二

- **pinned ids**: law_id `332AC0000000026` / rev `332AC0000000026_20261101_507AC0000000013`（INVENTORY `current_revision`, 施行 `2026-11-01`, law_title `租税特別措置法` と一致）; `data/raw/332AC0000000026_20261101_507AC0000000013.law.json`（実測 14,512,569 bytes）を独立再計算 → SHA-256 `e6e6013bbc0608c6b48dea01d50ac847c3e5d094f0420223171ffe1b5cf8d5ee`（doc-comment 記載値と一致）。自前 Python で `Article attr.Num="31_2"` を **1 件**検出（path `/law_full_text/children/1/children/3/children/1/children/4/children/2/children/2`, caption「（優良住宅地の造成等のために土地等を譲渡した場合の長期譲渡所得の課税の特例）」/ title「第三十一条の二」）→ **LOCATED**。
- **独立抽出**:
  | 原文リテラル | 独立計算 | Lean 定数／式 | 照合 |
  |---|---|---|---|
  | 第1号「課税長期譲渡所得金額が二千万円以下である場合…当該課税長期譲渡所得金額の百分の十に相当する金額」 | gain ≤ 20,000,000 → floor(gain×10/100) | `excellentLandBoundary = 20_000_000`, `excellentLandLowRate = ⟨10,100⟩`, `applyFloor` | ✅ |
  | 第2号「二千万円を超える場合…イ 二百万円 ロ …二千万円を控除した金額の百分の十五」 | gain > 20,000,000 → 2,000,000 + floor((gain−20,000,000)×15/100) | `excellentLandExcessRate = ⟨15,100⟩`, 同式 | ✅ |
  | 柱書「昭和六十二年十月一日から令和十年十二月三十一日…所有期間が五年を超える…優良住宅地等のための譲渡…次条の規定の適用を受けるものを除く」 | 条件は Bool、数式なし | `ExcellentLandTransferFacts` の 4 Bool / `excellentLandTransferEligible` | ✅ BY-DESIGN |
  | 柱書「前条第一項前段…にかかわらず」（非適格時は art.31(1) 一般税率 15%） | 15% fallback | `excellentLandLongTermRate = ⟨15,100⟩` | ✅ BY-DESIGN |
- **反例**: 独立 Python で上式を再実装し `by decide` 期待値と照合 → **矛盾 0**: `g=0→0`, `1→0`, `9→0`, `10→1`, `13→1`, `19,999,999→1,999,999`, `20,000,000→2,000,000`, `20,000,001→2,000,000`, `20,000,007→2,000,001`, `100,000,000→14,000,000`。新規境界例（0/1/5/9/10/13）と既存例すべて一致。
- **判定**: **BY-DESIGN / CONFIRMED 0**。原文 2 号（百分の十／二千万円＋二百万円＋百分の十五）存在。**LOCATED, UNRESOLVED なし**。scope: 柱書の適用要件（期間・五年超・証明・次条除外）は caller-established Bool, 第2項の定義各号・附則は非モデル化; 本件は第1項の計算スライス。
- **H/T/D/C/U**: H=「≤20M は 10%, >20M は 200万+15%」（境界を逆転／桁違いなら矛盾）/ T=SHA 再計算一致 + Num=31_2 を 1 件同定 + needle（百分の十/二千万円/二百万円/百分の十五/以下/を超える）逐語一致 + 上 10 境界再計算全一致 / D=BY-DESIGN（不一致 0, CONFIRMED 0）/ C=「以下」を ≤,「を超える」を > と解釈（原文に従う）, 端数切り捨ては `applyFloor` の定義 / U=柱書 Bool の実際の成否, 第2項・附則, 一般税率の独立モデル化。
- **限定**: 機械的独立クロスチェックであり**人間の法律レビューではない**。カーネル再実行は未実施（`by decide` 期待値と独立計算を照合）。一時 Python は `D:\CodexData\Temp\opencode\_adv16_*.py` に置き削除済み。

### InternationalTouristTaxRate.lean — 国際観光旅客税法 第十五条（税率）

- **pinned ids**: law_id `430AC0000000016` / rev `430AC0000000016_20260701_508AC0000000012`（INVENTORY `current_revision`, 施行 `2026-07-01`, law_title `国際観光旅客税法` と一致）; `data/raw/430AC0000000016_20260701_508AC0000000012.law.json`（実測 66,336 bytes）を独立再計算 → SHA-256 `486f27e35920bd186dd905d4a2269d01d9a4ecb28a2bb36514d7232276ead5ec`（doc-comment に sha 記載なし、本監査で初出）。自前 Python で `Article attr.Num="15"` を **1 件**検出（path `/law_full_text/children/1/children/2/children/1/children/1`, title「第十五条」）→ **LOCATED**; scoped 原文は 36 字の単一文。
- **独立抽出**:
  | 原文リテラル | 独立計算 | Lean 定数／式 | 照合 |
  |---|---|---|---|
  | 「国際観光旅客税の税率は、本邦からの出国一回につき、三千円とする。」 | 三千 = 3×1,000 = 3,000 円/出国 | `departureTaxRate = 3_000` | ✅ |
  | 「出国一回につき」→ 定額（出国回数は caller-established） | 総額 = n × 3,000 | `departureTaxRate * n`（Tests 境界例） | ✅ BY-DESIGN |
  | 出国の認定／非課税・軽減／課税標準／申告徴収／附則 | 数式なし・非モデル化 | スライス外 | ✅ BY-DESIGN |
- **反例**: 独立 Python で「三千円=3,000」を再実装し期待値と照合 → **矛盾 0**: `rate=3,000`, `×0=0`, `×1=3,000`, `×13=39,000`, 桁違い `300` / `30,000` を `departureTaxRate_not_scaled` が kernel 否定。新規境界例（0/1/13, 閾値 3,000 の saturating `3,000−3,001=0`）と一致。
- **判定**: **BY-DESIGN / CONFIRMED 0**。原文 1 断片（三千円／出国一回につき）存在。**LOCATED, UNRESOLVED なし**。scope: art.15(1) の税率定数のみ; 出国認定・非課税・課税標準・手続・附則は非モデル化; 本件は norm unit の計算スライス。
- **H/T/D/C/U**: H=「税率=3,000円/出国」（300 又は 30,000 なら矛盾）/ T=SHA 再計算 + Num=15 を 1 件同定 + needle（三千円/出国一回につき/税率）逐語一致 + 上境界再計算全一致 / D=BY-DESIGN（不一致 0, CONFIRMED 0）/ C=出国回数を自然数とするのは model candidate, 総額を n×rate とするのは原文「出国一回につき」に従う / U=出国の認定, 非課税・軽減, 附則, caller が与える回数の妥当性。
- **限定**: 機械的独立クロスチェックであり**人間の法律レビューではない**。カーネル再実行は未実施（`by decide` 期待値と独立計算を照合）。一時 Python は `D:\CodexData\Temp\opencode\_adv16_*.py` に置き削除済み。

---

注: 本レビューは pinned e-Gov 原文との機械的独立照合であり、法解釈の正しさや網羅性を保証する人間の法務レビューではない。両モジュールで反証可能な仮説・再現テストは原文および kernel 判定例と一致し、CONFIRMED な欠陥・UNRESOLVED は認められなかった（BY-DESIGN の scope 制限は各節に明記）。
