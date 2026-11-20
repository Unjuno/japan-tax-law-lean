# Adversarial Review — Batch 15（独立機械クロスチェック）

- レビュー日: 2026-11-21 / 役割: Adversarial Review Agent（形式化担当から独立）。**機械的独立照合であり人間の法解釈レビューではない。**
- 手法: doc-comment / `transcription_audit.py` は不信。pinned raw JSON の `law_full_text` を自前 Python（使い捨て `D:\CodexData\Temp\opencode\_adv15_*.py`, 実行後削除）で再帰平坦化し `Article` を `attr.Num` で定位、U+3000／空白を正規化して原文リテラルを抽出。pinned 原文から導いた整数式を独立再実装し `by decide`／`rfl` 期待値と照合。本環境に `lake`／`lean` なくカーネル再実行は未実施。

### AviationFuelTaxRate.lean — 航空機燃料税法 第十一条（税率）

- **pinned ids**: law_id `347AC0000000007` / rev `347AC0000000007_20250601_504AC0000000068`（INVENTORY `current_revision`, 施行 `2025-06-01`, law_title `航空機燃料税法` と一致）; `data/raw/347AC0000000007_20250601_504AC0000000068.law.json`（実測 54,627 bytes）を独立再計算 → SHA-256 `de83a01b558cca9d07af779b71416c9d15d5e62ecabfefcb00eb9e1cd18dbbde`（doc-comment 記載値とも一致）。自前 Python で `Article attr.Num="11"` を **1 件**検出（path `/children/1/children/2/children/1/children/2`, caption「（税率）」/ title「第十一条」）→ **LOCATED**; 正規化原文 leaf に doc-comment 引用が逐語 1 回一致（引用自体は不信、原文側から確認）。
- **独立抽出**:
  | 原文リテラル | 独立計算 | Lean 定数 | 照合 |
  |---|---|---|---|
  | 「航空機燃料一キロリットルにつき二万六千円」 | 二万=20,000 ＋ 六千=6,000 → 26,000 円/kL | `ratePerKilolitre = 26_000` | ✅ |
  | 「税率は…とする」→ 税額 | 数量(kL) × 26,000 | `taxForKilolitres k = k * ratePerKilolitre` | ✅ |
  | 数量変数・キロリットル単位（原文に変数定義なし） | caller-established `Nat` | `kilolitres : Money` 引数 | ✅ BY-DESIGN |
  | 第八条 非課税／第十条 課税標準／第十四条・第十五条 申告納付／附則 | 数式なし・非モデル化 | スライス外 | ✅ BY-DESIGN |
- **反例**: 独立 Python で `tax(k)=k×26,000` を再実装し `by decide`／`rfl` 期待値と照合 → **5 点とも一致, 矛盾 0**: `tax(0)=0`, `tax(1)=26,000`, `tax(2)=52,000`, `tax(3)=78,000`, `tax(100)=2,600,000`。Spec の `specSum 1=26,000`／`specSum 2=52,000` も一致, `rate_not_scaled` が 260,000（二十六万円）と 2,600（二千六百円）の 10 倍誤記を kernel で否定。`agree_aviation_fuel_tax` は全数量で対応を証明。
- **判定**: **BY-DESIGN / CONFIRMED 0**。原文 2 断片（一キロリットル／二万六千円）存在。**LOCATED, UNRESOLVED なし**。scope: 数量は caller-established な `Money`(Nat) で符号・端数・単位変換はモデル外; 非課税・課税標準・申告納付・附則は非モデル化; 本件は norm unit の計算スライスであり条・法レベルの網羅ではない。
- **H/T/D/C/U**: H=「率=26,000円/kL, 税額=k×率」（260,000 又は 2,600 なら矛盾）/ T=SHA 一致 + Article 1 件 + needle 逐語一致 + 上 5 境界再計算全一致 / D=BY-DESIGN（不一致 0, CONFIRMED 0）/ C=原文は税率のみで課税標準・申告は別条, 数量を Nat とするのは model candidate / U=第八条・第十条・第十四/十五条・附則, caller が与える数量の妥当性。
- **限定**: 機械的独立クロスチェックであり**人間の法律レビューではない**。カーネル再実行は未実施（`by decide`／`rfl` 期待値と独立計算を照合）。一時 Python は `D:\CodexData\Temp\opencode\_adv15_*.py` に置き削除済み。

### UsForcesDutyFreePenalty.lean — 在日米軍特例法 第十一条第三項（罰則）

- **pinned ids**: law_id `327AC0000000111` / rev `327AC0000000111_20250601_504AC0000000068`（INVENTORY `current_revision`, 施行 `2025-06-01`, law_title は対米地位和協定実施に伴う所得税法等の臨時特例に関する法律＝在日米軍特例法）; `data/raw/327AC0000000111_20250601_504AC0000000068.law.json`（実測 83,517 bytes）を独立再計算 → SHA-256 `04223c3926ac2a26dd0ff9120a712b6e3aa4af0285455db1be9163bd7074c1b2`（doc-comment に sha 記載なし、本監査で初出）。`Article attr.Num="11"` は **2 件**: 本則（path `/children/1/children/1/children/12`, caption「（免税物品の譲渡禁止等）」, 第1〜4項）と附則（path `/children/1/children/11/children/3`, 経過措置）。第3項に「一年以下…五十万円以下」を含む前者を罰則条と同定 → **LOCATED**（後者は誤同定を避け除外）。
- **独立抽出**:
  | 原文リテラル | 独立計算 | Lean 定数 | 照合 |
  |---|---|---|---|
  | 第3項「一年以下の拘禁刑」 | 一年=12 月, 「以下」→ ≤12（境界込み） | `maxImprisonmentMonths = 12` | ✅ |
  | 第3項「五十万円以下の罰金」 | 五十万=500,000 円, 「以下」→ ≤500,000（境界込み） | `maxFineYen = 500_000` | ✅ |
  | 第3項「又は」 | 拘禁刑／罰金は代替（併科でない） | `Penalty` の `imprisonment` \| `fine` | ✅ BY-DESIGN |
  | 「第一項の規定に違反した者」（違反要件・科刑） | 原文に数式なし、司法的判断 | `withinLimits` の上限判定のみ | ✅ BY-DESIGN |
  | 第1項・第2項・第4項(法人重課)・附則第十一条 | 非モデル化（scope 申告） | スライス外 | ✅ BY-DESIGN |
- **反例**: 独立 Python で「以下」を ≤ として再実装し `by decide` 期待値と照合 → **8 点とも一致, 矛盾 0**: 拘禁 `0/11/12 → true`, `13 → false`; 罰金 `0/499,999/500,000 → true`, `500,001 → false`。境界 12 月・500,000 円は**上限内**（「以下」の含み）で kernel 例と整合。`specWithin` が全 `Penalty` 値で `withinLimits` と一致（`specWithin_iff_withinLimits`）。
- **判定**: **BY-DESIGN / CONFIRMED 0**。原文 3 断片（一年以下／五十万円以下／又は）存在。**LOCATED, UNRESOLVED なし**。scope: 罰則の数値上限と代替関係のみ; 第1項の違反要件（用途外譲渡・政令承認）, 第2項の徴収, 第4項の法人重課, 附則第十一条は非モデル化; 実科刑は司法判断で本モデルは法的レビューを提供しない。
- **H/T/D/C/U**: H=「上限 12 月／500,000 円, 「以下」は境界込み, 「又は」は代替」（一年を 365 日, 五十万を 50,000 と読めば矛盾）/ T=SHA 再計算 + Num=11 を 2 件同定し罰則条を選択 + needle 逐語一致 + 上 8 境界再計算全一致 / D=BY-DESIGN（不一致 0, CONFIRMED 0）/ C=拘禁刑を日数で読む解釈もあり得るが原文「一年以下」に従い月単位を採用, 「又は」を併科と誤読する解釈も原文に反し除外 / U=政令承認の有無, 徴収・法人重課・附則, 実際の量刑。
- **限定**: 機械的独立クロスチェックであり**人間の法律レビューではない**。カーネル再実行は未実施（`by decide` 期待値と独立計算を照合）。一時 Python は `D:\CodexData\Temp\opencode\_adv15_*.py` に置き削除済み。

---

注: 本レビューは pinned e-Gov 原文との機械的独立照合であり、法解釈の正しさや網羅性を保証する人間の法務レビューではない。両モジュールで反証可能な仮説・再現テストは原文および kernel 判定例と一致し、CONFIRMED な欠陥・UNRESOLVED は認められなかった（BY-DESIGN の scope 制限は各節に明記）。
