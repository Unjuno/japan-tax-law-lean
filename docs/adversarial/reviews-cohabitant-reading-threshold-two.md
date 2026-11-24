### CohabitantReadingThresholdTwo.lean — 能登半島地震臨時特例法等施行令 art.2(2)（二人以上）

独立レビュー（**独立再抽出**／独立抽出）。著者コメント・ヘッダ・unit doc は信頼せず、raw JSON・INVENTORY・ジェネレータ補助関数・Lean 源文件・Lean カーネルから再導出した。表記は **H/T/D/C/U** 形式（H=仮説／独立再抽出, T=検査と実出力, D=判定, C=照合, U=留保）。対象は uncommitted 新規 3 ファイル＋pin＋3 import。以下すべての照合は一次資料に基づく。

---

#### CHECK 1 — raw SHA-256 再計算（CRLF→LF）

- **H（** impl ヘッダの `sha256: f3a109796d…a1df53` は二次情報。raw バイトから独立再計算し、impl ヘッダ・INVENTORY の両方と**照合**する。
- **T（** Python `hashlib.sha256(path.read_bytes().replace(b"\r\n", b"\n"))`
  - `raw byte length (as-is): 38189` / `has CRLF: False` / `normalized byte length: 38189`
  - `computed sha256 (CRLF->LF): f3a109796defc2d4af7372e2b174c464ee905eee92a73bc0df84a92e70a1df53`
  - `impl header sha256: f3a109796defc2d4af7372e2b174c464ee905eee92a73bc0df84a92e70a1df53` / `MATCH: True`
- **D（** **PASS**。bytes = **38189**、SHA-256 = **f3a109796defc2d4af7372e2b174c464ee905eee92a73bc0df84a92e70a1df53**。改行は CRLF なし（正規化前後で同一）。
- **C（** `data/INVENTORY.json` の `/laws[law_id=506CO0000000033]/raw_snapshot.source_sha256 = F3A109796DEFC2D4AF7372E2B174C464EE905EEE92A73BC0DF84A92E70A1DF53`（大小文字違いのみ一致）、`size_bytes = 38189`（一致）。確度: 高。
- **U（** なし。

#### CHECK 2 — 逐語 needle の独立走査・全局一致回数・法身份

- **H（** needle を独立に構成し、JSON を再帰 walk して部分文字列／完全一致を数える。ヘッダの path は使わない。
- **T（** Python 独立 walk
  - `total string leaves: 549`
  - `leaves containing needle (substring): 1` / `leaves exactly equal to needle: 1` / `count in whole-law concatenation: 1`
  - `LEAF: 所得税法施行令第二百五条第二項の規定は、前項に規定する親族と生計を一にする居住者が二人以上ある場合について準用する。`
  - `revision_info/law_title = 令和六年能登半島地震災害の被災者に係る所得税法及び災害被害者に対する租税の減免、徴収猶予等に関する法律施行令`
  - `law_info/law_id = 506CO0000000033` / `law_num = 令和六年政令第三十三号` / `law_type = CabinetOrder`
  - `law_revision_id = 506CO0000000033_20240221_000000000000000` / `current_revision_status = CurrentEnforced`
  - impl ヘッダ・spec ヘッダ・pin・task queue の needle はすべて同一文字列（`impl needle == canonical: True` / `spec needle == canonical: True`）。
- **D（** **PASS**。全局一致回数 = **1**（部分文字列 1、完全一致 leaf 1）。法 id・題名・リビジョン・施行状態は raw `revision_info` と INVENTORY `current_revision` の独立 2 来源で一致。
- **C（** needle leaf、INVENTORY `current_revision`、`law_info` の 3 来源で**照合**。確度: 高。
- **U（** `current_revision_status=CurrentEnforced`、`amendment_enforcement_date=2024-02-21` は今日 2026-11-25 と整合。なし。

#### CHECK 3 — 出所位置（第二条・第二項・MAIN、附則でないこと）

- **H（** needle の祖先チェーンを tag/attr レベルで独立再構成し、附則（SupplementaryProvision）配下でないことを確認する。
- **T（** Python 独立 walk + `task_queue.build_tasks`
  - 実チェーン: `law_full_text` → `Law:033/children[1] LawBody` → `children[3] MainProvision` → `children[1] Chapter:2` → `children[1] Article:2` → `children[3] Paragraph:2` → `children[1] ParagraphSentence` → `children[0] Sentence:1` → `children[0]` leaf。
  - `Article nodes with Num=2: 1`（全局 10 記事中で一意）/ `in 附則: False`
  - `Paragraph attr: {'Num': '2'}`，Article 2 は ¶1/¶2/¶3 を持ち needle は ¶2 の `Sentence(Num=1)`。
  - task queue: `kind = READING` / `article = 2` / `revision = 506CO0000000033_20240221_000000000000000` / `source_sha256 = f3a109…a1df53` / `coverage = {"exact": true, "unique_ids": true}`。
- **D（** **PASS**。記事 = **attr.Num "2"（第二条、全局一意）**、段落 = **attr.Num "2"（第二項）**、祖先は **MainProvision** 配下で **附則祖先なし**。¶2 Sentence#2 の読み替え（法第七十二条第一項→特例法第三条第一項）は別規範として未モデル化で適切。
- **C（** raw 祖先チェーンと Paragraph Num で**照合**。確度: 高。
- **U（** impl ヘッダの `Source path: LawBody[3]/MainProvision/MainProvision[1]/Article:2/Article#2/Paragraph#2/…` は `Chapter:2` ラッパーを省略した task queue 由来の簡略表記で、独立 walk の 0-based path と直接対応しない。**実体（第二条・第二項・MAIN）は一致**、非ブロッキング（F-1 参照）。

#### CHECK 4 — 漢字「二」= 2 と spec literal・durable pin の監査可能性

- **H（** 公式ジェネレータの `int_to_kanji` を実行し、spec の literal と pin のロードを機械的に検査する。
- **T（** `import generate_verification_evidence as gve`（`sys.path` に `scripts/ci`）
  - `int_to_kanji(2) = 二` / `kanji_variants(2) = {'二'}` / `int_to_kanji(2) in NEEDLE: True`
  - `needle contains 二人以上: True` / `needle contains 未満: False` / `needle contains 二以上: False`
  - `spec_literals(spec_text) = [2]` / `spec_literals == {2}: True` / `source_literals_verified({2}, needle): True`
  - `clause_correspondence: (True, 'spec numerals / rate ratio in clause')`
  - `checks_by_module()['CohabitantReadingThresholdTwo'] = {'law_id': '506CO0000000033', 'article': '2', 'needles': [needle], 'normative_id': ''}` → durable pin ロード済み。
  - task queue の normative unit: `NORM|e713fefceeb078384dd5e386ecdeab7c8fa82cb5b85adb34fb8e9028deb1bdbe` / `kind = READING` / text = needle 完全一致。
- **D（** **PASS**。二 ↔ 2 成立。spec の唯一の statutory literal は `{2}` で原文の「二人」と**照合**済み。pin は `checks_by_module()` により法 id / article `2` / needle とともに実際にロードされている。
- **C（** needle leaf・ジェネレータ補助関数・pin ロード・task queue の 4 来源で照合。確度: 高。
- **U（** NORM id は 2 つの Lean ヘッダと unit doc の 3 箇所にのみ存在し、`verification_evidence.json` / `EVIDENCE_GENERATION_AUDIT.json` には未掲載（F-2 参照）。ブロッキングではない。

#### CHECK 5 — Lean 三ファイルの構造（循環／普遍定理／example／禁止トークン／axiom）

- **H（** 三ファイルを実読し、(1) `spec*` defs が impl 名を再利用しないか、(2) 有限サンプリングでなく全 Nat の kernel チェック一致定理があるか、(3) `example` ≥5 かつ境界 ≥3 カテゴリか、(4) 禁止トークンが実行コードに無いか、(5) 普遍定理が axiom-free かを検査する。
- **T（** `read` 三ファイル + gve 補助関数 + `lake env lean`（scratch は repo 外の一時ファイル）
  - 禁止トークン（`strip_comments` 後）: impl/spec/tests すべて `[]`（impl 生テキストの 1 命中は doc コメントの `No \`sorry\`…` 文字列のみ）。
  - 宣言数: impl `example=0, theorem=3, def=2` / spec `example=2, theorem=1, def=3` / tests `example=11, theorem=0` → 合計 **13** ≥ 5（generator の `example\s*:` は binder 形式を除き 10 と計上）。
  - `independent_spec_ok(spec, impl) = True`。spec の `specCohabitantFloor : Nat := 2` / `specAppliesReading := decide (¬ residents < specCohabitantFloor)` は impl 名（`cohabitantFloor` / `appliesReading`）を一切参照せず、`<` と `<=` の別定式化。
  - ブリッジ定理 `agree_cohabitant_floor : ∀ residents : Nat, appliesReading residents = specAppliesReading residents` は `| 0 | 1 | 2 | Nat.succ (Nat.succ (Nat.succ k))` で**全 Nat を構造再帰で網羅**（有限グリッドではない）。
  - `boundary_evidence_categories(tests, literals=[2]) = {'zero','small_input','saturation','threshold_below','threshold_at','threshold_above'}`（6 カテゴリ ≥ 3）。
  - `#print axioms`（`lake env lean` で Tests を import）: `cohabitantFloor` / `appliesReading` / `two_inclusive` / `one_false` / `three_true` / `specCohabitantFloor` / `specAppliesReading` / `agree_cohabitant_floor` / `specCohabitantGrid` の **9 宣言すべて**が `'…' does not depend on any axioms`。import はエラーなく完了。
- **D（** **PASS**。(1) 循環なし。(2) 一致定理は全称で kernel 検証済み。(3) example 13、境界 6。(4) 禁止トークン 0。(5) 普遍定理は **axiom-free**（`#print axioms` で実証）。**「二人以上」意味論**: `2=true, 1=false, 3=true` は「以上 inclusive」に合致。
- **C（** 源文件・gve 出力・Lean カーネル出力を照合。確度: 高。
- **U（** `.lake/build` に olean が無く `LEAN_SRC_PATH` 経由の source import で検証したため、CI アテステーション.hash との突合は本レビュー範囲外（F-2 参照）。

#### CHECK 6 — 真の欠陥探索（以上/未満・off-by-one・誤ラベル・弱 spec・過剰主張）

- **H（** count 値、law/article/revision/sha の誤表示、循環的・弱い spec、off-by-one、準用内容の過剰主張を意図的に探す。
- **T（** CHECK 1–5 の全出力 + Article 2 全文 + unit doc
  - 原文は `二人以上`（`未満` は 0 命中）。strict `>` なら `appliesReading 2` は false になるが実値は true（`two_inclusive`）。 specimen spec も `¬ n < 2` で inclusive。
  - OFF-BY-ONE: `1=false / 2=true / 3=true` は境界の両側で正しい。
  - 誤ラベル: law id・題名・第二条第二項・リビジョン・SHA はすべて一次資料と一致（CHECK 1–3）。
  - 過剰主張: impl の Scope 節と unit doc は「準用される_cross-law_ 規定の内容、生計を一にする居住者の定義、他項・執行規則は NOT MODELLED／caller-established」と明示。¶2 Sentence#2 の読み替えも未モデル化。
  - 変数契約の `Unit 人 (persons, cohabiting relatives)`: 原文の被計数対象は「前項の親族と生計を一にする**居住者**」であり、親族本人ではない（F-3 参照）。数値閾値 2 自体への影響なし。
- **D（** **PASS（転記・身份・sha・spec・意味論に関しブロッキング欠陥なし）**。`cohabitantFloor = 2` は「二人以上」の下限と正しく対応し、以上 inclusive の off-by-one もない。非ブロッキングの F-1〜F-3 を記録する。
- **C（** raw JSON・INVENTORY・gve・task queue・unit doc・源文件の独立 6 来源で照合。確度: 高。
- **U（** 法的判断（準用の効果・読み替え・居住者の定義を含む）は人間に留保（`LEGAL_REVIEW_PENDING`）。

---

#### F-1（ヘッダ Source path の簡略表記 — 非ブロッキング・ドキュメント級）

- **H（** impl ヘッダの `Source path` が実 JSON 祖先チェーンと食い違い、誤った出所表示ではないか、という仮説。
- **T（** CHECK 3 の実出力: 実チェーンは `MainProvision[1] → Chapter:2[1] → Article:2[3] → Paragraph:2[1]`。ヘッダは `LawBody[3]/MainProvision/MainProvision[1]/Article:2/Article#2/Paragraph#2/…` と表記し `Chapter:2` を省略（task queue の `source_path` と同一文字列）。needle leaf・記事・段落は一致。
- **D（** **判定: 実在する表記の曖昧さ（転記ミスではない）**。1-based／0-based と階層省略が混在する記述上の問題であり、第二条・第二項・MAIN という実体は正しい。ブロッキング欠陥ではない。
- **C（** raw 祖先チェーンとヘッダを照合。確度: 高（事実関係は再現済み）。
- **U（** 修正提案: ヘッダの `Source path` を実際の 0-based JSON path（`law_full_text/children[1]/children[3]/children[1]/children[1]/children[3]/children[1]/children[0]/children[0]`）に合わせるか `Chapter:2` を明示すること。真偽値は変わらない。

#### F-2（NORM id のエビデンス未登録 — 非ブロッキング・パイプライン級）

- **H（** 主張された NORM id が生成エビデンスに登録されていないため、下流のトレーサビリティが切れていないか、という仮説。
- **T（** grep `e713fefceeb…deb1bdbe` → 3 命中（`UNIT_COHABITANT_READING_THRESHOLD_TWO.md`、impl、spec）。`verification_evidence.json` / `EVIDENCE_GENERATION_AUDIT.json` には 0 命中。`checks_by_module()` の pin entry も `normative_id: ''`（16 pin 中 14 個が同仕様で、本モジュールのみの問題ではない）。
- **D（** **判定: 事実（未登録）**。転記・意味論の誤りではない。needle が全局一意のため unit 同定は task queue 側で成立し、誤同定は起きていない。
- **C（** repo 全体 grep と gve 出力で照合。確度: 高。
- **U（** 生成パイプライン管理者に当該 NORM id の `verification_evidence.json` 登録予定を確認すること。

#### F-3（被計数対象の呼称 — 非ブロッキング・ドキュメント級）

- **H（** impl ヘッダの `Unit 人 (persons, cohabiting relatives)` が原文の「生計を一にする**居住者**」を「親族」と誤記していないか、という仮説。
- **T（** 原文: `前項に規定する親族と生計を一にする居住者が二人以上ある場合`。¶1 は「親族」の定義（総所得金額 48 万円以下等）、¶2 はその親族と生計を一にする「居住者」の数を数える。impl の `residents : Nat` という引数名は原文に合致。
- **D（** **判定: 事実だが非ブロッキング**。ヘッダの括弧内呼称が不正確なだけで、数値閾値 `2` と「以上 inclusive」の意味論には影響しない。引数名 `residents` は正しい。
- **C（** 原文 ¶1/¶2 と impl ヘッダを照合。確度: 高。
- **U（** 修正提案: ヘッダを `Unit 人 (persons: 居住者 living with the 前項 relative)` 等に修正すること。法的な「生計を一にする」の範囲は人間の法的レビューに留保。

---

### Verdict

**具体的なブロッキング欠陥は検出されなかった。** raw SHA-256（38189 bytes / `f3a109796d…a1df53`）、needle 全局一意性（1 件）、法身份（令和六年能登半島地震災害…臨時特例に関する法律施行令 / 第二条 / 第二項 / MAIN / `CurrentEnforced`）、漢字二=2、pin の `checks_by_module()` ロード、spec の独立性と全 Nat 普遍一致定理（`#print axioms` により 9 宣言すべて axiom-free）、example 13 件と 6 境界カテゴリ、実行コードの禁止トークン 0 — すべて独立再抽出で **PASS**。F-1（ヘッダ path の簡略表記）、F-2（NORM id 未登録）、F-3（被計数対象の呼称）はいずれもドキュメント／パイプライン級の留保であり、転記・特定情報・「二人以上 = 2 以上 inclusive」の中核意味論の誤りではない。

**法的正確性を主張するものではない。人間の法的レビューは未完了（LEGAL_REVIEW_PENDING）。** 本レビューはソース対応・構造・符号化の经验的検証に限られ、準用の効果、¶2 Sentence#2 の読み替え、所得税法施行令第二百五条第二項の内容、および「生計を一にする居住者」の定義は人間の法的判断に委ねる。
