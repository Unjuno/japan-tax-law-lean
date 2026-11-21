# Adversarial Review — Batch 59（機械的独立クロスチェック）

- 2026-11-22 / adversarial review agent。対象モジュールは読み取り専用でレビュー。Lean / data / scripts / 他 docs は未変更、未 commit/push。
- 手法: 自前 Python で pinned raw JSON を直接 read し、`law_full_text` を再帰 flatten して `Article attr.Num` で locate（空白は正規化）。doc-comment / `transcription_audit.py` は信じず raw から独立抽出。SHA-256 は full-read と chunked-read で独立再計算（両者一致）。`lake`/`lean` は未実行（`by decide` 例はカーネル判定される期待値と独立計算を照合）。**本レビューは機械的独立クロスチェックであり、人間の法律専門家レビューではない。**

### AccountingSubjectsCount.lean — 税理士法 第六条（会計学に属する科目）

- **pinned ids / 独立再抽出**: law_id `326AC1000000237`（税理士法）, rev `326AC1000000237_20251001_505AC0000000053`（施行 2025-10-01, amend `505AC0000000053`）; `data/raw/326AC1000000237_20251001_505AC0000000053.law.json`（454,932 bytes）SHA-256 `46d956e2c48954577ec3479c5e8c83a2a2ff913860a2ba6b2eea327f3107916f`（full/chunked 独立一致、doc-comment と一致）。raw の `law_info.law_id` / `revision_info.law_revision_id` / 施行日 2025-10-01 / amend `505AC0000000053` を独立照合 → **metadata 修正不要 (CONFIRMED)**。自前 flatten で `Article attr.Num="6"` を 3 件検出、main provision `law_full_text/children/1/children/2/children/1/children/2`（caption「試験の目的及び試験科目」, 381 文字）を **LOCATED**。
- **needle 逐語（独立再抽出）**: 当該 Article 正規化文字列に対し自前 needle 「会計学のうち簿記論及び財務諸表論の二科目」を `.count()` → **1 回**（全文でも 1 回）。doc-comment の pinned needle と逐語一致。
- **二科目 = 2**: 原文「二科目」の「二」= 2 を独立確認。impl `prescribedCount = 2` / `accountingSubjects = ["簿記論","財務諸表論"]`（length 2）、spec `specCount = 2` / `specSubjects`（length 2）と照合 → 全一致。`二 = 2` は INCLUSIVE/EXACT count（両科目を含む）。

  | 原文リテラル | 独立計算 | Lean 定数 / 式 | 照合 |
  |---|---|---|---|
  | 「簿記論及び財務諸表論の二科目」 | 列挙 = {簿記論, 財務諸表論}, 要素数 2 | `accountingSubjects`, `specSubjects`, `prescribedCount = 2` | ✅ |
  | 「二科目（以下「会計学に属する科目」という。）」 | 名称定義のみ、数値変更なし | `isPrescribedSubject` の membership | ✅ BY-DESIGN |
- **境界（独立再計算 ≥3 カテゴリ）**: `n = [].length=0`（zero）, `["簿記論"].length=1`（small_input）, `accountingSubjects.length=2`（threshold_at, `prescribedCount` と一致）, `3 = [3要素].length`（threshold_above, 2 を超過）→ 4 カテゴリを kernel-decided 例で登録。自前再計算 n↦n (n=0,1,2,3) は全 `by decide`/`rfl` 期待値と一致、矛盾 0。
- **判定**: **CONFIRMED 0（原文と Lean の実食い違いなし）**。BY-DESIGN: ①附則に同番号 Article が 2 件あるため main provision を選択（metadata correction: Num=6 の 3 件のうち 1 件のみが本スライス、他 2 件は経過措置 — BY-DESIGN/CONFIRMED）、②税法に属する科目の三科目ルール・試験実施・免除・政令詳細は非モデル化。**LOCATED 1（main provision）/ UNRESOLVED なし。**
- **H/T/D/C/U**: H=「二」を 2 以外（1/3）と読む、又 科目名を誤記する; T=Num=6 locate + needle 1 回 + 二科目=2 + 4 境界独立再計算⇔全 `by decide`/`rfl`（全一致）; D=NOT_CONFIRMED（不一致 0, CONFIRMED 0, BY-DESIGN 2, LOCATED 1）; C=「二科目」を上限 2 未満や下限と読む解釈は原文「簿記論及び財務諸表論の二科目」で排斥、附則 Article を本条と混同する解釈は caption/パスで排斥; U=試験科目の詳細・免除・政令事項は caller-established／要専門家。
