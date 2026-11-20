### IncomeSocialInsuranceDeduction.lean — 所得税法 第七十四条（社会保険料控除）

- **pinned ids**: law_id `340AC0000000033` / rev `340AC0000000033_20261001_507AC0000000070`（施行 2026-10-01, amend `507AC0000000070`）; `data/raw/340AC0000000033_20261001_507AC0000000070.law.json` を独立再計算 → SHA-256 `94C4A7AD83726CDE60787967ED4E959585AD0AF9279D25DB9AA02264B3FE606B`（doc-comment と一致, 16,405,085 bytes）。自前 Python で `law_full_text` を再帰 flatten（201,007 nodes）し `Article attr.Num="74"` を 3 件検出 → 内 1 件 caption「（社会保険料控除）」を **LOCATED**（他 2 件は附則の経過措置・防衛財源で無関係）。原文 para1 に上限・率・%・円の数値トークン **0 個**。
- **独立抽出**: 原文 leaf を `re.sub(r"[\s　]+","",...)` 正規化後、doc-comment の 4 needle（74(1) 全文 / 74(2) 前文 / 号一 健康保険 / 号五 国民年金）が**各 1 回**出現を count で確認（全 source 正規化文字列）。原文・Lean は doc-comment / `transcription_audit.py` を信じず raw から直接抽出。

  | 原文リテラル | 独立計算 | Lean 定数 | 照合 |
  |---|---|---|---|
  | 「その支払つた金額又はその控除される金額を、…総所得金額、退職所得金額又は山林所得金額から控除する。」（上限・率なし） | 控除額 = paid（cap/rate なし） | `socialInsuranceDeduction paid = paid` | ✅ |
  | 同 減算式 | 控除後 = max(total−paid, 0) | `taxableAfterSocialInsurance t p = t - p` | ✅ |
  | 「社会保険料とは、次に掲げるもの…政令で定めるもの（第九条第一項第七号…を除く）」 | 該当性は caller-established, 式に入れず | 引数に Bool なし | ✅ BY-DESIGN |
  | 「居住者が…自己又は…親族の負担すべき」「総所得金額等・支払額の算定」 | 入力として caller-established | `totalIncome` / `paid` 引数 | ✅ BY-DESIGN |
  | 給与から控除される場合も「その控除される金額」を同式 | paid として同一式 | 支払/控除で式を分けない | ✅ |
  | 税額計算・控除順序・端数処理（通則法 118/119）等 | 非モデル化 | モデル外 | ✅ BY-DESIGN |

- **反例**: 独立 Python で定式 `ded(p)=p`, `tax(t,p)=t-p if p≤t else 0` を再計算し `.lean`/`-Spec`/`-Tests` の全 `by decide` 期待値 + Spec 同意グリッド 110 点（10×11）と照合 → **全一致, 矛盾 0**。境界: `tax(1000000,250000)=750000`, `tax(250000,250000)=0`（同額）, `tax(100000,250000)=0`（paid>total アンダーフロー）, `tax(101,3)=98` / `tax(1000,1)=999`（端数）, `tax(0,0)=0`, `ded(1000000000)=1000000000`。
- **判定**: **CONFIRMED 0（原文と Lean の実食い違いなし）**。BY-DESIGN 4: ①社会保険料該当性（政令・九条一項七号除外）・居住者性・親族範囲・支払額算定は caller-established で金額式に反映せず、②total/paid は入力、③saturating 零下限は Nat 化に伴う選択（原文は減算式で paid>total は想定外）、④税額計算・控除順序・端数処理は非モデル化。全 source の「社会保険料控除」13 箇所に限度/上限/超過の文言なし → 上限なしの modeling と整合。**LOCATED, UNRESOLVED なし**。
- **H/T/D/C/U**: H=控除額に原文なき上限/率が入る、又 控除後が原文の減算式と食い違う; T=4 needle 各1回 + 原文 leaf 数値トークン0 + 全 `by decide` 期待値 & 110 点独立再計算; D=NOT_CONFIRMED（不一致 0, CONFIRMED 0, BY-DESIGN 4）; C=「控除額=支払額」を「控除後=総所得−paid」と混同する懸念は原文 1 項が控除額と減算結果を明確に区別し spec も同式で排斥; U=社会保険料該当性の政令具体値・「準ずるもの」範囲・給与控除額の算定・端数処理の法的取扱いは caller-established／要専門家。
- **限定**: 本レビューは機械的独立クロスチェックであり、**人間の法律レビューではない**。本環境では `lake`/`lean` が PATH になくカーネル再実行は未実施（`by decide` 例は構成上カーネル判定される期待値と独立計算を照合）。一時 Python スクリプトは `D:\CodexData\Temp\advrev_7` に置き削除済み。
