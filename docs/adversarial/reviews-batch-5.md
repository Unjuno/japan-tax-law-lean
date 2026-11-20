# Adversarial Review — Batch 5（機械的独立照合）

- 2026-11-21 / adversarial review agent。対象は読み取り専用（Lean / data / scripts / 他 docs 未変更、未 commit/push）。
- 手法: 自前 Python で `law_full_text` を再帰 flattenし `Article` の `attr.Num` で locate（U+3000/空白正規化）。doc-comment / `transcription_audit.py` は信じず pinned 原文から直接抽出。一時スクリプトは `D:\CodexData\Temp\opencode\adv_review_b5` に置き削除済み。SHA-256 は Python hashlib と certutil で独立再計算。`lake`/`lean` は PATH になくカーネル再実行は未実施（`by decide` 例は構成上カーネル判定、期待値と独立計算を照合）。**本レビューは機械的独立クロスチェックであり人間の法律専門家レビューではない。**

### CustomsRetaliatoryDuty.lean — 関税定率法 第六条

- **pinned ids**: law_id `143AC0000000054` / rev `143AC0000000054_20260601_508AC0000000005`（施行 2026-06-01、関税定率法 明治四十三年法律第五十四号 第六条「報復関税等」）; `data/raw/143AC0000000054_20260601_508AC0000000005.law.json` SHA-256 `924a01d3014fd93ea50c6588d5a7ed414becef2ca806918081a18a6ef986ae9c`（hashlib＝certutil 独立一致）。`Article Num="6"` path `Law/LawBody/MainProvision` → **LOCATED**（一意 1 件、原文 3 項＋号・ただし書）。
- **独立抽出**（原文リテラル → 独立計算 → Lean 定数 → 照合）:

  | 原文リテラル | 独立計算 | Lean 定数 | 照合 |
  |---|---|---|---|
  | 「…別表の税率による関税のほか、当該貨物の課税価格と同額以下の関税を課することができる。」(1項) | 追加関税 ≤ 課税価格（等号含む inclusive） | `retaliatoryDutyWithinCap cv add = decide (add ≤ cv)` | ✅ |
  | 「…その貨物の課税価格と同額以下の関税を課することができる。」(2項) | 同上 | `retaliatoryDutyWithinCap` / `retaliatoryDutyCap cv = cv` | ✅ |
  | 「同額以下」→ 上限＝課税価格と同額 | cap = cv | `retaliatoryDutyCap cv = cv` | ✅ |
  | 「別表の税率による関税のほか」 | 基本関税＋追加関税 | `totalDuty_le` (base+add ≤ base+cv) | ✅ BY-DESIGN |
  | 「ただし、前項第一号に規定する紛争解決機関の手続に委ねられるべき場合は、この限りでない。」(2項但書) | 適用除外（法的判断） | 非モデル化 / caller-established | ✅ BY-DESIGN |
- **反例**: 原文由来の式 `add ≤ cv` で 8 境界を独立再計算 ⇔ `by decide`。(cv,add)=(1e6,1e6)→true / (1e6,999999)→true / (1e6,1000001)→false / (0,0)→true / (0,1)→false / (100,50)→true / (100,100)→true / (100,101)→false。impl / Spec / Tests の全期待値と一致、矛盾 0。等号境界 (100,100) は「以下」通り true（`<` ではない）。
- **判定**: CONFIRMED 0（反証なし）。BY-DESIGN: ①「別表の税率による関税」基本関税は別スライスで非モデル化、②国・貨物指定・WTO 承認・2項但書の紛争解決機関委ねは法的判断で caller-established、③課税価格は art.4 系統の caller-established Money、④追加関税の具体額も caller-established。いずれもモジュールがスコープとして明記しており矛盾ではない（NOT_CONSTRUED as defect）。
- **限定**: 機械的独立クロスチェックのみ。人間法律レビューではない。カーネル再実行不可（PATH に lake/lean なし）。
- **H/T/D/C/U**: H=上限リテラル「同額以下」・式が Lean と食い違う; T=原文 flatten→Num=6 locate→8 境界独立再計算⇔`by decide`（全一致）; D=BY-DESIGN（不一致 0 / CONFIRMED 0）; C=「同額以下」を `<` と読む解釈は日本語「以下」＝ inclusive で排斥、基本関税・但書適用は caller-established で矛盾ではない; U=課税価格の算定、政令による国・貨物指定・承認範囲、2項但書の該当性は人間レビュー要。
