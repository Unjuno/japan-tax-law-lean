### CommitteeTermTwoYears.lean — 国税審議会令 art.4（二年）

独立レビュー（独立再抽出／独立抽出）。著者コメントは信頼せず、raw JSON・INVENTORY・ジェネレータ補助関数・Lean 源文件から再導出した。表記は **H/T/D/C/U** 形式（H=仮説／独立再抽出, T=検査コマンドと実出力, D=判定 PASS/FAIL（具体値付き）, C=照合／確度, U=未解決・留保）。作業ツリーはレビュー中に `c41d7a19` → `012fcbbc add_committee_term_unit`（branch `formalize/committee-term-two-years`）へコミットされたが、対象 4 ファイルの内容は再読して不変を確認済み。

---

#### CHECK 1 — raw SHA-256 再計算（CRLF→LF）

- **H（** impl ヘッダの `sha256: 165d5edc…0186` は二次情報。raw バイトから独立再計算し、impl ヘッダ・INVENTORY の両方と照合する。
- **T（** `python jtl_committee_analyze.py`
  - 実出力: `raw bytes on disk: 28843` / `CRLF count: 0` / `bare LF count: 0`
  - `sha256(normalized CRLF->LF): 165d5edc3356cf47fead9f75eac0d3cd410266ef01827d8880614af90d8c0186`
  - `sha256(raw bytes as-is): 165d5edc3356cf47fead9f75eac0d3cd410266ef01827d8880614af90d8c0186`
  - `impl header sha: 165d5edc…0186` / `normalized MATCH header: True` / `raw MATCH header: True`
- **D（** **PASS**。bytes = **28843**、SHA-256 = **165d5edc3356cf47fead9f75eac0d3cd410266ef01827d8880614af90d8c0186**。正規化前後で一致（当該ファイルは改行なしの 1 行 JSON のため CRLF→LF は恒等）。
- **C（** 照合先: `data/INVENTORY.json` → `/laws[205]/raw_snapshot/source_sha256 = 165D5EDC…18A6`（大小文字違いのみ一致）、`size_bytes = 28843`（一致）。確度: 高。
- **U（** 改行が存在しないため「CRLF→LF 正規化」の効果は検証不能だが、両形式で同一ハッシュであり報告値に影響しない。

#### CHECK 2 — 逐語 needle の独立走査・全局一致回数・法身份

- **H（** needle を `\u59d4\u54e1…\u3002` の Unicode エスケープで独立構成し（cmd コードページ汚染を避ける）、JSON を再帰 walk して部分文字列／完全一致の両方で数える。ヘッダの path は使わない。
- **T（** `python jtl_committee_analyze.py` / `python jtl_committee_analyze3.py` / `python jtl_committee_analyze4.py`
  - `needle occurrences (substring) in WHOLE law: 1`
  - `EXACT PATH: /law_full_text/children/[1]/children/[2]/children/[3]/children/[2]/children/[1]/children/[0]/children/[0]`
  - `LEAF: '委員の任期は、二年とする。'`
  - `revision_info/law_title = '国税審議会令'` / `current_revision_status = 'CurrentEnforced'` / `law_info/law_id = '412CO0000000278'`
  - INVENTORY: `/laws[205]/current_revision = {'law_revision_id': '412CO0000000278_20260401_507CO0000000412', 'law_title': '国税審議会令', 'current_revision_status': 'CurrentEnforced', 'amendment_enforcement_date': '2026-04-01', 'amendment_law_id': '507CO0000000412', …}`
- **D（** **PASS**。全局一致回数 = **1**（部分文字列 1、完全一致 leaf 1）。`revision_info.law_title`（国税審議会令）= INVENTORY `current_revision.law_title`（国税審議会令）。`law_id` = 412CO0000000278、`law_revision_id` = 412CO0000000278_20260401_507CO0000000412（pin と一致）、`current_revision_status` = CurrentEnforced（施行日 2026-04-01、今日 2026-11-23 と整合）。
- **C（** raw の `revision_info` と INVENTORY の独立 2 来源で法 id／題名／リビジョン／施行状態が一致。確度: 高。
- **U（** `NORM|5adb98f94dfcc1816db82d141229cfd8c175fbebd2c2a3ad22d59aafbc2a2032` は 2 つの Lean ヘッダと `docs/UNIT_COMMITTEE_TERM_TWO_YEARS.md` にのみ存在し、`data/verification_evidence.json` / `data/EVIDENCE_GENERATION_AUDIT.json` には未掲載（grep で 0 命中）。当該 commit のデータ差分は別ユニット（CustomsTariffArt20No2Art13ProvisoException）の再整形であり、本ユニットのエビデンス登録はレビュー後工程と思料。ブロッキングではないが、パイプライン管理者に登録予定を確認すること。

#### CHECK 3 — 出所位置（第四条・第一項・MAIN）

- **H（** needle の祖先チェーンを tag/attr レベルで独立再構成し、附則（SupplProvision）配下でないことを確認する。
- **T（** `python jtl_committee_analyze2.py` / `python jtl_committee_analyze5.py`
  - チェーン: `Law`(attr Num=278) → `children[1] LawBody` → `children[2] MainProvision` → `children[3] Article attr={'Num':'4'}` → `children[2] Paragraph attr={'Num':'1'}` → `children[1] ParagraphSentence` → `children[0] Sentence attr={'Function':'main','Num':'1'}` → `children[0]` leaf。
  - `Article count in whole law: 13` / `Article Num=4 count: 1`
  - `ArticleCaption '（委員の任期等）'` / `ArticleTitle '第四条'`
- **D（** **PASS**。記事 = **attr.Num "4"（第四条、全局で一意）**、段落 = **attr.Num "1"（第一項）**、祖先は **MainProvision** かつ Sentence `Function='main'` で **MAIN provision**。`SupplProvision`（附則）祖先はなし。誤記・記事/段落の off-by-one なし。
- **C（** impl ヘッダの `Article:4/Article#4/Paragraph#1/…` は attr レベルで整合。ただしヘッダの `LawBody[2]/MainProvision/MainProvision[3]/…` は 1-based と Num 基準が混在する表記で、独立 walk の 0-based `children[1]/children[2]/children[3]` と直接対応しない（記述上の曖昧さのみ、実体は一致）。確度: 高。
- **U（** ヘッダの path 表記を 0-based JSON path に合わせる修正は非ブロッキングの改善候補。

#### CHECK 4 — 漢字「二」= 2 と spec literal の監査可能性

- **H（** 暗黙の常識ではなく、公式ジェネレータの `int_to_kanji` / `_kanji_int` を実行して双方向で確認する。
- **T（** `python jtl_committee_analyze4.py`（`sys.path` に `scripts/ci` を追加し `import generate_verification_evidence as gve`）
  - `int_to_kanji(2) = '二'` / `_kanji_int('二') = 2` / `kanji_variants(2) = {'二'}` / `_KANJI[2] = '二'`
  - Tests: `example : specCommitteeTermYears = 2 := rfl`（`CommitteeTermTwoYearsTests.lean:39`）
- **D（** **PASS**。二 ↔ 2 は双方向に成立。spec の `def specCommitteeTermYears : Nat := 2` はソース上の literal で `rfl` により監査可能、needle の「二」と対応する。
- **C（** needle 完全一致 leaf、INVENTORY 題名、ジェネレータ補助関数の 3 来源で整合。確度: 高。
- **U（** なし。

#### CHECK 5 — Lean 三ファイルの構造（ Circular / 普遍定理 / example / 禁止トークン）

- **H（** 三ファイルを実読し、(1) spec* defs が impl 名を再利用していないか、(2) 有限サンプリングではなく全 Nat に対する kernel Checker 一致定理があるか、(3) `example` ≥5 かつ境界 ≥3 カテゴリか、(4) `sorry`/`admit`/`axiom`/`Classical.choice` が実行コードに無いか、を機械的に検査する。
- **T（** `read` 三ファイル + `python jtl_committee_analyze4.py`
  - 禁止トークン（コメント除去後）: `CommitteeTermTwoYears.lean forbidden: {}` / `CommitteeTermTwoYearsSpec.lean forbidden: {}` / `CommitteeTermTwoYearsTests.lean forbidden: {}`。（impl の生テキストでは `sorry/admit/axiom/Classical.choice` が各 1 命中するが、いずれも 30 行目の `No ...` という doc コメント内の文字列であり、実行コードには 0。）
  - 宣言数: impl `example=0, theorem=3` / spec `example=1, theorem=3` / tests `example=11, theorem=2`（合計 example **12**）。
  - ブリッジ定理: `agree_committee_term (years : Nat) : isCommitteeTerm years = specIsCommitteeTerm years`（`by_cases` + `omega` + `simp`、全 Nat を網羅）。
- **D（** **PASS**。(1) spec* defs（`specCommitteeTermYears` / `specIsCommitteeTerm` / `specTermGrid`）は impl 名を一切参照せず、独立演算子（`¬ years < 2 && ¬ 2 < years`）を使用。循環なし。(2) 一致定理は **普遍**（`years : Nat` 全称、有限グリッドではない）。(3) example 12（≥5）、境界カテゴリは **{0,1} → false / {2} → true / {3} → false** に加え任意 `x` の 4 類（≥3）。(4) 実行コードの禁止トークン 0。**「ちょうど 2 年」意味論**: `2=true, 1=false, 3=false` は main 文「二年とする」に合致（下方的にも上方的にも厳密）。
- **C（** 構造・テキストは高確度で照合済み。ただし本レビューは単一書き込み制約を遵守するため `lake build` は実行していない（`omega` の利用可能性は `TaxFinance` の `import Std` 経由と推測）。カーネル検証の「実行」自体は未再現、確度: 中（構造は高）。
- **U（** Finding **F-1** を参照（同段落のただし書のスコープ留保）。

#### CHECK 6 — 真の欠陥探索（誤値・誤ラベル・弱 spec・off-by-one）

- **H（**  term 値、law/article/revision/sha の誤表示、循環的・弱い spec、off-by-one を意図的に探す。「二年とする」が `2 true / 1 false / 3 false` と本当に整合するかを再考する。
- **T（** CHECK 1–5 の全出力 + `python jtl_committee_analyze5.py` による Article 4 全文ダンプ（`二年`/`任期` スキャン）。
  - Article 4 ¶1 全文: main `委員の任期は、二年とする。` / **proviso `ただし、補欠の委員の任期は、前任者の残任期間とする。`** / ¶2 `委員は、再任されることができる。` 他。
  - `二年/任期` 全局命中: 政令番号「平成十二年…」、ArticleCaption、needle、上記 proviso、附則「平成二十二年四月一日から施行する」のみ。
- **D（** **PASS（ transcription / identity / sha / spec に関し欠陥なし）**。term 値 2 は正しく、law id・記事「第四条」・第一項・リビジョン・SHA の誤表示なし。off-by-one なし。「二年とする」の main ルールに対する `2 true / 1 false / 3 false` は正しい。追加で **F-1**（スコープ留保、非ブロッキング）を記録する。
- **C（** raw JSON・INVENTORY・ジェネレータ補助関数・源文件の独立 4 来源で照合。確度: 高。
- **U（** F-1 の修正提案は下記。法的判断は人間に留保。

---

#### F-1（スコープ／解釈上の留保 — 非ブロッキング・ドキュメント級）

- **H（** `isCommitteeTerm years` を「法定の委員任期としてあり得る長さ」と読むと、 ¶1 のただし書（補欠委員は前任者の残任期間）の下では 1 年でも合法たり得るため、`isCommitteeTerm 1 = false` は誤否定になり得る、という仮説を検証する。
- **T（** `python jtl_committee_analyze5.py` 実出力: `Sentence attr Function='proviso'` の leaf = `ただし、補欠の委員の任期は、前任者の残任期間とする。`（needle と同一 Article/Paragraph 内、同一 LawBody/MainProvision 配下）。Tests には `example : isCommitteeTerm 1 = false := by decide`。
- **D（** **判定: 実在する留保（code/転記ミスではない）**。impl ヘッダは「appointment/renewal rules … NOT MODELLED」とスコープ除外を宣言しており、補欠の残任期間もこの除外に概念的に含まれる。したがって needle 自体の転記・「ちょうど 2 年」の main ルールは正しく、ブロッキング欠陥ではない。ただし変数契約「The predicate is true exactly at two years」には「補欠（ただし書）を除く本則」であることが明記されておらず、`isCommitteeTerm` という名前と `isCommitteeTerm 1 = false` が一般ルールとして誤読される危険がある。
- **C（** raw の proviso leaf と impl ヘッダのスコープ記述を照合。確度: 高（事実関係は再現済み、重大度は解釈に依存）。
- **U（** 具体的修正（いずれも truth value は変更しない）: (a) impl ヘッダの Variable contract に「本則（補欠を除く）に限る。¶1 ただし書の補欠の残任期間は appointment rules として対象外」の一文を追加し、(b) Tests の (b)(d) コメントに `isCommitteeTerm 1 = false` は補欠委員の合法的な残任期間を否定するものではない旨を明記、または (c) 述語名を `isRegularCommitteeTerm` に変更／補欠用述語を別ユニットとして明示的に分離。人間の法的レビューで採用方針を決定すること。

---

### Verdict

**具体的なブロッキング欠陥は検出されなかった。** raw SHA-256（28843 bytes / `165d5edc…0186`）、needle 全局一意性（1 件）、法身份（国税審議会令 / 第四条 / 第一項 / MAIN / CurrentEnforced）、漢字二=2、spec の独立性と全 Nat 普遍一致定理、example 12 件と 3 以上の境界カテゴリ、実行コードの禁止トークン 0 — すべて独立再抽出で PASS。F-1 は同段落のただし書に起因する**スコープ／ドキュメント級の留保**であり、転記・意味論・特定情報の誤りではない。

**法的正確性を主張するものではない。人間の法的レビューは未完了（LEGAL_REVIEW_PENDING）。** 本レビューはソース対応・構造・符号化の经验的検証に限られ、尤其 F-1 のただし書の法的取扱い、および `lake build` によるカーネル再検証はレビュー担当者の判断・実行に委ねる。
