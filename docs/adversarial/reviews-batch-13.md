# Adversarial Review — Batch 13（独立機械クロスチェック）

- レビュー日: 2026-11-21 / 役割: Adversarial Review Agent（形式化担当から独立）。**機械的独立照合であり人間の法解釈レビューではない。**
- 手法: doc-comment / `transcription_audit.py` は不信。自前 Python（使い捨て `D:\CodexData\Temp\opencode\_adv13_*.py`, 実行後削除）で `law_full_text` を再帰平坦化し `Article` を `attr.Num` で定位, U+3000/空白を正規化して原文リテラル・式を抽出。pinned 原文から導いた整数式を独立再実装し `by decide` 期待値と照合。本環境に `lake`/`lean` なくカーネル再実行は未実施。

### LandValueTaxRate.lean — 地価税法 第二十二条（税率）

- **pinned ids**: law_id `403AC0000000069` / rev `403AC0000000069_20250601_504AC0000000068`（`revision_info.law_revision_id` 及び `data/INVENTORY.json` と一致, 施行 `2025-06-01`, law_title `地価税法`）; `data/raw/403AC0000000069_20250601_504AC0000000068.law.json`（実測 408,857 bytes）を独立再計算 → SHA-256 `0fe4bb9c6d07ff6e648db1d5bdb49af134af1b1f7563ea641ea8f87d4f72cbe2`（certutil / INVENTORY の `source_sha256` とも一致）。自前 Python で `Article attr.Num="22"` を **1 件**検出, caption「（税率）」/ title「第二十二条」→ **LOCATED**。原文 leaf を正規化抽出（doc-comment の引用は正規化原文に 1 回一致, 逐語）。
- **独立抽出**:
  | 原文リテラル | 独立計算 | Lean 定数 | 照合 |
  |---|---|---|---|
  | 「課税価格から基礎控除の額を控除した残額」 | residual = max(0, base − ded) | `landValueTax` の `taxableBase - basicDeduction`（Nat saturating） | ✅ |
  | 「残額に千分の三の税率を乗じて計算した金額」 | 3/1000 = ⟨3,1000⟩; tax = residual×3//1000 | `landValueTaxRate = ⟨3,1000,by decide⟩`, `applyFloor = m*num/den` | ✅ |
  | 「地価税の額は…金額とする」（端数処理の明記なし） | 切捨て (floor) を選択 | `TaxRate.applyFloor`（`numDen=(3,1000)` を rfl/decide で固定） | ✅ BY-DESIGN |
  | 課税価格・基礎控除の額・地価税該当性 | 原文に数式なし（caller-established） | `Money` 引数（Bool 化せず） | ✅ BY-DESIGN |
  | art. 23（評価の原則）| 金額算術なし, 非モデル化 | モデル外（doc-comment が scope 申告） | ✅ BY-DESIGN |
- **反例**: 独立 Python で `lvt(b,d)=max(0,b-d)*3//1000` を再実装し **13 点**を照合 → **全一致, 矛盾 0**。境界: `lvt(0,0)=0`, `lvt(0,500)=0`（零課税）, `lvt(500,500)=0`（base=ded）, `lvt(499,500)=0`（base<ded, saturating）, `lvt(100,0)=0`（300//1000→0）, `lvt(334,0)=1`（1002//1000）, `lvt(999,0)=2`（2997//1000）, `lvt(1000,0)=3`, `lvt(3000,1000)=6`, `lvt(1000000,999000)=3`, `lvt(2999,1000)=5`, `lvt(37500,12000)=76`, `lvt(999999,1)=2999`。`-Tests.lean` の全 `by decide`（0/500/500, 499/500, 100/0, 334/0, 999/0, 1000/0, 3000/1000, 1000000/999000 等）及び `-Spec.lean` の `specLandValueTax` 6 点・`lvtCheckGrid`・`agreeLandValueTaxRate` サンプルと期待値一致。
- **判定**: **CONFIRMED 0（原文と Lean の実食い違いなし）**。BY-DESIGN 4: ①端数処理は原文に明記なく `applyFloor`（切捨）を選択, ②課税価格・基礎控除・地価税該当性は caller-established で `Money` 引数として渡す, ③ base<ded の underflow を `Nat` saturating 0 とし入力妥当性を caller に委ねる, ④ art. 23 は金額算術なしで非モデル化。千分の三 = 3/1000 と控除後残額への税率適用は原文と整合。**LOCATED, UNRESOLVED なし**。
- **H/T/D/C/U**: H=千分の三(3/1000)・控除後残額・切捨てが原文と食い違う, 又 underflow/端数を架空に仮定している; T=Article Num=22 の LOCATED + 3 needle（千分の三/控除した残額/乗じて計算した金額）一致 + 13 点独立再計算⇔全 `by decide`/`-Spec` 期待値; D=NOT_CONFIRMED（不一致 0, CONFIRMED 0, BY-DESIGN 4）; C=「乗じて計算した金額」の端数を四捨五入/切り上げと読む解釈もあり得るが原文に明記なく切捨を選択, 又 base<ded をエラー/未定義とする解釈もあり得るが原式に記載なく saturating を選択; U=課税価格・基礎控除の具体的算定・地価税該当性・端数処理の法的取扱い・art. 23 の時価評価は caller-established／要専門家。
- **限定**: 機械的独立クロスチェックであり**人間の法律レビューではない**。カーネル再実行は未実施（`by decide` 例は構成上カーネル判定される期待値と独立計算を照合）。一時 Python は `D:\CodexData\Temp\opencode\_adv13_*.py` に置き削除済み。
