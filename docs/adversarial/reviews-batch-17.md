# Adversarial Review — Batch 17（独立機械クロスチェック）

- レビュー日: 2026-11-21 / 役割: Adversarial Review Agent（形式化担当から独立）。**機械的独立照合であり人間の法解釈レビューではない。**
- 手法: doc-comment / `transcription_audit.py` は不信。使い捨て自前 Python（`D:\CodexData\Temp\opencode\_adv17_*.py`, 実行後削除）で pinned 生 JSON を直接読み, SHA-256 再計算, `law_full_text` を再帰平坦化して `Article` を `attr.Num` で定位, 原文 leaf を U+3000/空白正規化で抽出。原文から導いた整数式を独立再実装し `by decide` 期待値と照合。本環境に `lake`/`lean` なくカーネル再実行は未実施。

### CustomsSameContentLimit.lean — 関税定率法 第十四条第十七号ただし書

- **pinned ids（独立再確認）**: law_id `143AC0000000054` / rev `143AC0000000054_20260601_508AC0000000005`（raw `revision_info.law_revision_id` と一致, 施行 `2026-06-01`, law_title `関税定率法`, status `CurrentEnforced`）。doc-comment は信用せず JSON 側から抽出。
- **H（仮説/反証可能）**: 同内容物品は「二本以内」= 上限 2 本（境界込み ≤）, よって `withinSameContentLimit c = (c ≤ 2)`。「二本」を 2/20/200 と誤読, 又は「以内」を < と読めば矛盾として反証される。
- **T（検出/照合）**: 生 JSON 実測 9,407,678 bytes → SHA-256 独立再計算 `924a01d3014fd93ea50c6588d5a7ed414becef2ca806918081a18a6ef986ae9c`（doc-comment 記載値と一致）。`tag=Article, attr.Num="14"` を **1 件**検出: `/law_full_text/children/1/children/1/children/25` → **LOCATED**。同 Article の `Item attr.Num="17"` 内 `Sentence attr.Function="proviso", Num="2"` から原文 leaf を抽出（doc-comment の参照 path とも整合）。
- **独立抽出（原文リテラル）**: proviso leaf「ただし、内容を同じくするものについては、そのうちの二本以内に限る。」— 正規化原文 Article14 に **1 回**一致（引用を信用せず原文側で確認）。主文は「ニュース映画用のフィルム…ニュース用のテープ…」で, proviso が数量制限を付す構造。
- **リテラル/数式比較**:
  | 原文リテラル | 独立計算 | Lean | 照合 |
  |---|---|---|---|
  | 「二本以内」 | 二 = 2, 「以内」→ ≤ 2（境界込み） | `sameContentLimit : Money := 2`（rfl） | ✅ |
  | 「…の二本以内に限る」 | within(c) = (c ≤ 2) | `withinSameContentLimit c := c ≤ sameContentLimit` | ✅ |
  | 個数変数・単位「本」（原文に変数定義なし） | caller-established Nat | `count : Money`（Nat） | ✅ BY-DESIGN |
  | 本則無条件免税・政令手続・他号 | 数式なし・非モデル化 | スライス外 | ✅ BY-DESIGN |
- **反例再計算（≥3）**: 独立 Python で `within(c)=(c≤2)` を再実装 → `0→true, 1→true, 2→true, 3→false, 13→false`, saturating `2-3=0`。`-Tests.lean` の `by decide` 期待値と全面一致, 矛盾 0。Spec の `specWithin`（0/1/2 のみ admitted）とも整合。
- **D（判定）**: **BY-DESIGN / CONFIRMED 0**。原文断片は存在し **LOCATED, UNRESOLVED なし**。scope: 例外の数量的範囲のみ; 本則・政令・他号は非モデル化。
- **C（解釈の余地）**: 「以内」を <（二本を除く）と読む解釈は原文に反し除外; 単位を円と誤読する解釈も「本」と明記し除外。
- **U（未解決）**: 「内容を同じくする」認定, 本則の適用可否, 申告手続は caller-established／要専門家。
- **限定**: **機械的独立クロスチェックであり人間の法律レビューではない**。カーネル再実行は未実施（`by decide` 期待値と独立計算を照合）。一時 Python は削除済み。

### CustomsInvestigationDeadline.lean — 関税定率法 第八条の二第八項

- **pinned ids（独立再確認）**: law_id `143AC0000000054` / rev `143AC0000000054_20260601_508AC0000000005`（raw と一致, 施行 `2026-06-01`, law_title `関税定率法`）。doc-comment は不信として JSON から抽出。
- **H（仮説/反証可能）**: 「前項の調査は第四項の調査が終了する日までに終了」→ 期限は `endDay ≤ refDay`（「までに」は境界込み）。これを < 又は ≥ と読めば反証される。
- **T（検出/照合）**: 生 JSON 実測 9,407,678 bytes → SHA-256 再計算 `924a01d3014fd93ea50c6588d5a7ed414becef2ca806918081a18a6ef986ae9c`（pinned と一致）。`tag=Article, attr.Num="8_2"` を **1 件**検出: `/law_full_text/children/1/children/1/children/18` → **LOCATED**。同 Article の `Paragraph attr.Num="8"` の `Sentence Num="1"` から原文 leaf を抽出。
- **独立抽出（原文リテラル）**: 「前項の調査は、第四項の調査が終了する日までに終了するものとする。」— 正規化原文 Article8_2 に **1 回**一致（doc-comment 引用は不信）。前項＝第7項, 第四項＝第4項 の項番号も同 Article 内で確認。
- **リテラル/数式比較**:
  | 原文リテラル | 独立計算 | Lean | 照合 |
  |---|---|---|---|
  | 「…が終了する日までに終了する」 | 前項終了日 ≤ 第四項終了日（境界込み） | `withinInvestigationDeadline e r := e ≤ r` | ✅ |
  | 第四項「調査が終了する日」= 基準日 | refDay を上限とし同日は認容 | `refDay : Nat` | ✅ |
  | 日付変数・単位「日」（添字のみで定義なし） | caller-established Nat | `endDay refDay : Nat` | ✅ BY-DESIGN |
  | 調査手続・实体規則・他項・政令 | 数式なし・非モデル化 | スライス外 | ✅ BY-DESIGN |
- **反例再計算（≥3）**: `end≤ref` と独立 spec `end-ref=0`（Nat 切捨て減算）を再実装 → `(0,0)→true`, `(3,5)→true`, `(5,5)→true`, `(6,5)→false`, `(13,13)→true`; `6-5=1≠0`, `12-13=0`（saturating）。`-Tests.lean` の `by decide`／`omega` 期待値と一致, 矛盾 0。`agree_investigation_deadline` が全組で対応を証明。
- **D（判定）**: **BY-DESIGN / CONFIRMED 0**。**LOCATED, UNRESOLVED なし**。scope: 二つの調査終了日の時間的順序のみ; 調査手続・実体規則・他項は非モデル化。
- **C（解釈の余地）**: 「までに」を <（基準日を除く）と読む解釈は「その日までに」に反し除外; 日付を実数/負数とする解釈も添字 Nat を選択。
- **U（未解決）**: 各調査の実際の終了日, 第4項/第7項該当性の認定は caller-established／要専門家。
- **限定**: **機械的独立クロスチェックであり人間の法律レビューではない**。カーネル再実行は未実施（`by decide` 期待値と独立計算を照合）。一時 Python は削除済み。

---

注: 本レビューは pinned e-Gov 原文との機械的独立照合であり, 法解釈の正しさや網羅性を保証する人間の法務レビューではない。両モジュールで反証可能な仮説・再現テストは原文および kernel 判定例と一致し, CONFIRMED な欠陥・UNRESOLVED は認められなかった（BY-DESIGN の scope 制限は各節に明記）。
