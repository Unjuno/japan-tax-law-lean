# Adversarial Review — Batch 18（独立機械クロスチェック）

レビュー日: 2026-11-21 / 独立レビューエージェント。**機械的独立照合であり人間の法解釈レビューではない**。doc-comment と `transcription_audit.py` は不信; 使い捨て自前 Python（`D:\CodexData\Temp\opencode\_adv18_*.py`, 実行後削除）で pinned 生 JSON を直接読んだ。本環境に lake/lean なし, カーネル再実行は未実施（`by decide` 期待値と独立計算を照合）。

### CustomsReadingSubstitution.lean — 関税定率法 第七条第十五項

- **pinned ids（JSON 側から独立再確認）**: law_revision_id `143AC0000000054_20260601_508AC0000000005`, law_title 関税定率法, amendment_enforcement_date `2026-06-01`, current_revision_status `CurrentEnforced`（`revision_info` より抽出; doc-comment は信用せず）。
- **H（反証可能な仮説）**: 第七項本文の「一年以内に」は「一年以内において速やかに」と読み替えられ, 一年（12 箇月）の外側上限は保たれ, 「速やかに」の迅速性要件が付く。原文が別文言/別条なら反証される。
- **T（検出/照合）**: 生 JSON 実測 `9,407,678` bytes → SHA-256 独立再計算 `924a01d3014fd93ea50c6588d5a7ed414becef2ca806918081a18a6ef986ae9c`（pinned と一致）。`tag=Article, attr.Num="7"` を **1 件**検出 `/law_full_text/children/1/children/1/children/16` → **LOCATED**; 同 Article の `Paragraph attr.Num="15"` 直下 `Sentence attr.Num="2"` の原文 leaf を取得。
- **独立抽出（原文リテラル）**: 「この場合において、第七項本文中「一年以内に」とあるのは、「一年以内において速やかに」と読み替えるものとする。」— Article7 全文で 「一年以内において速やかに」 は **1 回**, 「第七項本文中」 は **1 回**（引用を信用せず原文側で確認; 「六月以内に限り延長することができる」は別 proviso として 2 回出現）。
- **リテラル/数式比較**:
  | 原文リテラル | 独立計算 | Lean | 照合 |
  |---|---|---|---|
  | 「一年以内に」 | 読替前フレーズ | `DeadlinePhrase.withinOneYear` | ✅ |
  | 「一年以内において速やかに」 | 読替後フレーズ | `DeadlinePhrase.withinOneYearPromptly` | ✅ |
  | 「…と読み替えるものとする」 | before→promptly, 二重読替は不変 | `readingSubstitution`（両 arm が promptly, idempotent） | ✅ |
  | 「一年以内」 | 一年 = 12 箇月（両フレーズ共通） | `outerDeadlineMonths = 12` | ✅ BY-DESIGN（原文は漢字「一年」, 数値 12 は暦換算） |
  | 「速やかに」 | 迅速性要件 false→true | `hasPromptnessReq` false/true | ✅ |
  | 「この場合において」発動条件, 六月延長 proviso, 他項・政令 | 数式なし・非モデル化 | スライス外 | ✅ BY-DESIGN |
- **反例再計算（≥3, 自前 Python）**: ① `outerDeadlineMonths(readingSubstitution withinOneYear)=12`（読替後も 12, 境界込）② `prompt(orig)=false → prompt(subst)=true` ③ `readingSubstitution² = readingSubstitution`（idempotent）④ `12 ∈ 1..13`（small-positive 境界）。`-Tests.lean` の `rfl`/`by decide` 期待値と全面一致, 矛盾 0。
- **D（判定）**: **BY-DESIGN / CONFIRMED 0**。**LOCATED, UNRESOLVED なし**（レビュー対象は読替え文言のみ）。
- **C（解釈の余地）**: 「一年」→12 は暦換算による推論（原文に数値 12 は無い）; 「速やかに」は定性要件で数値閾値を持たない; 六月延長 proviso は読替文字列外のため非モデル化（外側上限 12 は本文のみの値）。
- **U（未解決）**: 発動条件「この場合において」の認定, 六月延長の適用, 第七項の実体的調査規則は caller-established／要専門家。
- **限定**: **機械的独立クロスチェックであり人間の法律レビューではない**。カーネル再実行は未実施。一時 Python は削除済み。
