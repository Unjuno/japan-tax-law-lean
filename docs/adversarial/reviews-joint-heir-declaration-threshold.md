### JointHeirDeclarationThreshold.lean — 石油石炭税法施行令 art.13(3)（二人以上）

独立 adversarial レビュー。著者コメント・ヘッダは信頼せず、raw JSON バイト・INVENTORY・`scripts/ci/generate_verification_evidence.py` の実関数・Lean 三ファイルから独立再抽出し、照合／判定を行った（**H/T/D/C/U** 形式: H=仮説、T=検査と実出力、D=判定、C=照合・確度、U=留保）。作業ツリーは uncommitted 新規ワーク（`20391531` + 当該 triple と pin、JapanTaxLaw.lean の 3 import）を対象とし、レビュー中に源文件を一切変更していない。

---

#### CHECK 1 — raw SHA-256 再計算（CRLF→LF）と impl ヘッダ照合

- **H（** impl ヘッダの `sha256: a11df504…76499d` は二次情報。raw バイトから独立再計算し、impl ヘッダおよび INVENTORY の `raw_snapshot.source_sha256` と照合する。
- **T（** 独立 Python スクリプトで `Path.read_bytes()` → `replace(b"\r\n", b"\n")` → `hashlib.sha256`：
  - `raw exists: True` / `bytes on disk: 135052` / `CRLF count: 0` / `LF total: 0` / `bare LF: 0`
  - `normalized bytes: 135052`
  - `sha256(normalized CRLF->LF): a11df5044e3b0e7bbd81d87d328d08467def928a3fec7031b1c8a5b60a76499d`
  - `sha256(raw as-is): a11df5044e3b0e7bbd81d87d328d08467def928a3fec7031b1c8a5b60a76499d`
  - `header sha: a11df5044e3b0e7bbd81d87d328d08467def928a3fec7031b1c8a5b60a76499d` / `normalized == header: True`
  - INVENTORY: `/laws[law_id=353CO0000000132]/raw_snapshot.source_sha256 = A11DF504…76499D`（大小文字差のみ） / `size_bytes = 135052`（一致）。
- **D（** **PASS**。bytes = **135052**、SHA-256 = **a11df5044e3b0e7bbd81d87d328d08467def928a3fec7031b1c8a5b60a76499d**。改行なし 1 行 JSON のため CRLF→LF は恒等で、正規化前後ともヘッダ値と一致。SHA の誤表示なし。
- **C（** raw バイト・impl ヘッダ・INVENTORY の 3 来源で整合。確度: 高。
- **U（** 改行が存在しないため「CRLF→LF 正規化が効いたこと」自体は実証不能だが、両形式で同一ハッシュであり結論に影響しない。

#### CHECK 2 — 逐語 needle の独立走査・全局一致回数・法身份

- **H（** ヘッダの source path を使わず、needle を Unicode 文字列として独立構成し、JSON を再帰 walk して **全局** の文字 leaf で部分一致／完全一致を数える。さらに法 id・題名・リビジョン・施行状態を raw `revision_info` と INVENTORY の独立 2 来源で突き合わせる。
- **T（** 独立 walk の実出力：
  - `needle substring hits in string leaves: 1` / `EXACT LEAF MATCH: True`
  - `PATH: /law_full_text/children/1/children/2/children/9/children/4/children/1/children/0/children/0`
  - `LEAF: 相続人が二人以上ある場合には、前項の申告書は、各相続人が連署して提出するものとする。`
  - `needle count in whole raw text: 1` / `needle count in json.dumps(ensure_ascii=False): 1`
  - `revision_info.law_title: 石油石炭税法施行令` / `law_info.law_id: 353CO0000000132`
  - `revision_info.law_revision_id: 353CO0000000132_20250401_507CO0000000006` / `current_revision_status: CurrentEnforced` / `amendment_enforcement_date: 2025-04-01`
  - INVENTORY: `law_id=353CO0000000132` は 1 件のみ、`current_revision.law_title=石油石炭税法施行令`、`law_revision_id=353CO0000000132_20250401_507CO0000000006`、`current_revision_status=CurrentEnforced`、`law_type=CabinetOrder`、`official_title=石油石炭税法施行令`。
  - `gve.scoped_article_text("353CO0000000132","13")` の長さ 827、needle 含有 `True`。`core.norm(needle)` は不変で、正規化 scoped 文中にも `True`。
  - 参考（誤認の排除）: 同一文は他法にも模板として存在する。例: `data/raw/360CO0000000005_…law.json` にも 1 件（当該 raw の `law_title` は **たばこ税法施行令**）。つまり「全局で 1 件」は **本 pinned law 内** の話であり、全体としての一致回数 1 と混同しない。
- **D（** **PASS**。本 law 内での一致回数は **1**（leaf 完全一致 1、raw 生文字列 1）。law id・題名・リビジョン・施行状態・法種別は raw と INVENTORY で一致。誤ラベル（法・記事・リビジョン・SHA）なし。
- **C（** raw JSON・INVENTORY・`scoped_article_text`・`core.norm` の独立 4 来源で照合。確度: 高。
- **U（** 同一文言が複数法令に現れるため、needle だけで法を同定してはならない。本レビューは law id + SHA + INVENTORY で同定した。この点は既存 `JointHeirThreshold2.lean` のヘッダが 360CO0000000005 を「相続税法施行規則」と呼ぶ記述とも無関係ではないが、本 triple の対象外（別ユニットの hive に留保）。

#### CHECK 3 — 出所位置（第十三条・第三項・MAIN provision・not 附則）

- **H（** needle を含む leaf から parent リンクを再構成し、tag/attr の祖先チェーンを独立導出。「Article `Num=13` / Paragraph `Num=3` / MainProvision 配下 / Sentence `Function=main` / SupplProvision なし」を検証する。
- **T（** 祖先チェーン（root→leaf、実出力）：
  - `tag: Law attr Num=132 (CabinetOrder)` → `tag: LawBody` → `tag: MainProvision` → `tag: Article attr {"Num": "13"}` → `tag: Paragraph attr {"Num": "3"}` → `tag: ParagraphSentence` → `tag: Sentence attr {"Function": "main", "Num": "1", "WritingMode": "vertical"}` → leaf。
  - partial path: `/law_full_text/children/1/children/2/children/9/children/4/children/1/children/0/children/0`（0-based）。
  - Article 13 全文: caption `（移出に係る原油、ガス状炭化水素又は石炭についての課税標準及び税額の申告）`、¶1 申告書記載事項、¶2 死亡時の相続人申告（三号に「相続人が二人以上ある場合には…相続分により按分…」）、¶3 main が needle、¶4/¶5 は ¶3 ただし書の方法の補則。
- **D（** **PASS**。記事 = **attr.Num `"13"`（第十三条）**、段落 = **attr.Num `"3"`（第三項）**、祖先に **MainProvision** があり **SupplProvision（附則）はなし**、Sentence は **`Function="main"`**。impl ヘッダの `第十三条 (art. 13), 第三項 (3)`、`Article:13/…/Paragraph#3/…/Sentence#1` と実体は一致。off-by-one（第十二条/第十四条、第二項/第四項）なし。
- **C（** 祖先チェーン・Article 13 全文・ヘッダの 3 来源で照合。確度: 高。
- **U（** ヘッダの `LawBody[2]/MainProvision/MainProvision[9]/Article:13/Article#13/…` は 1-based と Num 基準が混在する記述で、独立 walk の 0-based `children[2]`（MainProvision）/`children[9]`（Article）と直接は対応しない。**記述上の曖昧さのみ**で実体（Article 13 / Paragraph 3 / main）は一致。非ブロッキングの改善候補として、`LawBody/MainProvision/Article[Num=13]/Paragraph[Num=3]/Sentence[Num=1, main]` への統一を推奨。

#### CHECK 4 — 漢字「二人」= 2 と spec literal の監査可能性・durable pin の取込

- **H（** 常識でなく公式ジェネレータの `int_to_kanji` / `_kanji_int` / `kanji_variants` / `spec_literals` / `source_literals_verified` を import して実行し、二 ⇄ 2 の双方向と literal の source 対応を確認する。あわせて `checks_by_module()` が durable pin を実際に読み込むかを確認する。
- **T（** 実出力（`sys.path` に `scripts/ci` を追加して import）：
  - `int_to_kanji(2) = 二` / `_kanji_int('二') = 2` / `kanji_variants(2) = {'二'}`
  - `spec_literals(spec) = [2]` / `matched_spellings = {'2': ['二']}` / `source_literals_verified(lits, needle) = True`
  - `gve.checks_by_module()['JointHeirDeclarationThreshold'] = {"law_id": "353CO0000000132", "article": "13", "needles": ["相続人が二人以上ある場合には、…"]}`
  - `pin exists: True`、`data/TRANSCRIPTION_PINS/JointHeirDeclarationThreshold.json` の内容: `name=… art.13(3)…`、`law_id=353CO0000000132`、`kind=article`、`art=第十三条`、`needles=[needle]`。
  - Spec 側の literal: `def specHeirFloor : Nat := 2`（Spec:29）、impl 側: `def heirFloor : Nat := 2`（Impl:37）、Tests:14 `example : heirFloor = 2 := rfl`、Spec:46 `example : specHeirFloor = 2 := rfl`。
- **D（** **PASS**。二 ↔ 2 は双方向に成立し、needle の「二」に spec/impl の literal `2` が対応、`rfl`/`decide` で監査可能。**`checks_by_module()` は durable pin を実際に読み込み**、law_id/article/needle を登録済み（ハードコードされたヘッダに依存していない）。
- **C（** ジェネレータ実関数・pin JSON・`checks_by_module()` 出力・spec/impl/tests 原文の 4 来源で照合。確度: 高。
- **U（** `norm` の `NORM|27ba36ac…a59f3a` は impl/spec ヘッダと `docs/UNIT_JOINT_HEIR_DECLARATION_THRESHOLD.md` にのみ存在し、`data/` 配下（verification_evidence.json 等）には **0 命中**。新規 uncommitted ユニットのエビデンス登録はレビュー後工程と思料されるが、登録漏れの可能性は残る。具体的修正: コミット後に `data/TRANSCRIPTION_CHECK_REGISTRY.json` / `data/verification_evidence.json` へ当該 norm id を登録し、`generate_verification_evidence.py` の再生成で `adversarial_review` 軸が立つことを確認する（truth value 変更なし・非ブロッキング）。

#### CHECK 5 — Lean 三ファイルの構造（循環性・普遍定理・example・禁止トークン）

- **H（** 三ファイルを実読し、(1) `spec*` defs が impl 名を再利用していないか、(2) 有限サンプリングではなく全 Nat に対する kernel チェック一致定理があるか、(3) `example` ≥5 かつ境界カテゴリ ≥3、(4) 実行コードに `sorry`/`admit`/`axiom`/`Classical.choice` が無いかを機械的に検査する。
- **T（** `gve.strip_comments()` 後に `re.findall`、以及 `gve.boundary_evidence_categories()`：
  - 宣言数: impl `example=0, theorem=3, def=2` / spec `example=2, theorem=1, def=3` / tests `example=10, theorem=0, def=0` → 合計 **example 12**。
  - 禁止トークン（コメント除去後）: impl/spec/tests すべて `{}`（impl の生テキストでは各 1 命中するが、いずれも 31 行目の `No sorry, admit, axiom or Classical.choice.` という doc コメント内の文字列で、実行コードは 0）。
  - ブリッジ定理: `agree_heir_floor (heirs : Nat) : needsJointDeclaration heirs = specNeedsJoint heirs`（`by_cases h : 2 <= heirs` + `omega` + `simp`、全 Nat を全称で網羅）。`omega` は `TaxFinance.lean` の `import Std` 経由で利用可能（既存モジュールと同じパターン）。
  - spec* defs の実体（comment-stripped）: `def specHeirFloor : Nat := 2` / `def specNeedsJoint (heirs : Nat) : Bool := decide (¬ heirs < specHeirFloor)` / `def specHeirGrid : Bool := let f := specHeirFloor; [0,1,f-1,f,f+1].all fun heirs => specNeedsJoint heirs == decide (f <= heirs)` — **impl 名への参照は 0**。impl 名 (`heirFloor`, `needsJointDeclaration`) が spec に現れるのは `agree_heir_floor` の定理文と `unfold` のみで、これは唯一の意図された橋渡し。
  - `independent_spec_ok(spec_text, impl_text) = True`。
  - `boundary_evidence_categories(tests_text, lits) = {'zero', 'small_input', 'threshold_below', 'threshold_at', 'threshold_above', 'saturation'}`（**6 カテゴリ**）。
  - Tests の境界例: `0→false`、`1→false`、`2→true`、`3→true`、`2+0=2`、impl/spec 一致（0/1/2）、任意 `x` への `agree_heir_floor x` 適用、`specHeirFloor=2`。
- **D（** **PASS**。(1) 循環なし（spec* defs は独立演算子 `¬ heirs < floor`、impl は `floor <= heirs`）。(2) 一致定理は有限グリッドではなく **全 Nat に対する kernel チェック済みの普遍定理**。(3) example 12（≥5）、境界 6 カテゴリ（≥3）。(4) 実行コードの禁止トークン 0。**以上 inclusive** の意味論も `2=true / 1=false / 3=true` で正しく、`<` との取り違え（未満）や 2 での off-by-one なし。
- **C（** 三ファイル実読 + ジェネレータ実関数の機械出力で照合。確度: 高（構造・テキスト）。本レビューは単一書き込み制約を遵守し `lake build` は実行していないため、カーネル検証の「実行」自体は未再現（既存 CI アテステーションに委ねる）。確度: 中（ビルド実行）。
- **U（** なし（構造上の留保は上記 C のビルド未実行のみ）。

#### CHECK 6 — 真の欠陥探索（以上 vs 未満 / off-by-one / 誤ラベル / 弱 spec / スコープ）

- **H（** 閾値 2・比較演算子・法/記事/リビジョン/SHA・spec 独立性を反証する形で再考し、さらに ¶3 のただし書や周辺条項が阈値モデルを否定しないかを Article 13 全文で探す。
- **T（** CHECK 1–5 の全出力に加え、Article 13 全文を独立 dump：
  - ¶3 main = needle、`Sentence proviso 2` = `ただし、当該申告書は、各相続人が各別に提出することを妨げない。`
  - ¶4 = ただし書の方法で提出する場合の個人番号記載不要、¶5 = 他相続人への要領通知。¶2 三号も「相続人が二人以上ある場合には…」で同じく 2 を閾値とする。
  - 「相続人」「連署」を含む他 Article は 13/15/16 のみで、needle 自体は Article 13 に一意。
- **D（** **PASS（転記・同一性・SHA・閾値意味論・spec に具体的欠陥なし）**。Check 1–5 により、hash 一致、needle 全局一意、Article 13/¶3/MAIN、CurrentEnforced、二=2、独立 spec と全 Nat 普遍一致、example 12、境界 6、禁止トークン 0 を確認。`以上 vs 未満`、`2 での off-by-one`、誤ラベル、循環 spec はいずれも反証されなかった。¶3 ただし書は **連署の強制という法効果** に関わるため、本 triple が明示的にモデル化する「人数条件の閾値」とは対象が異なる（下記 U-1 として記録）。
- **C（** raw JSON・INVENTORY・ジェネレータ・Lean 原文・Article 13 全文の独立 5 来源で照合。確度: 高。
- **U（** 下記 U-1 / U-2 / U-3 を参照。いずれも非ブロッキング。

---

#### U-1（¶3 ただし書に伴うスコープ留保 — 非ブロッキング・ドキュメント級）

- **H（** `needsJointDeclaration` という名前を「連署申告が必ず要求される」と読むと、¶3 ただし書（`各別に提出することを妨げない`）が存在するため誤読を招かないか、という仮説を検証する。
- **T（** 独立 dump 実出力: 同 ¶3 に `Sentence attr Function='proviso'` として `ただし、当該申告書は、各相続人が各別に提出することを妨げない。` が存在。impl ヘッダ Scope は「the 連署 procedure … NOT MODELLED (caller-established)」と明記。`needsJointDeclaration 2 = true` はあくまで閾値 trigger flag。
- **D（** **判定: 実在する留保（code/転記ミスではない）**。needle の main 文と「二人以上 = 2 以上 inclusive」は正しく、スコープ宣言もそれを明示しているためブロッキング欠陥ではない。ただし述語名と Tests コメントは一般ルールとして誤読され得る。
- **C（** ¶3 proviso leaf と impl ヘッダ Scope 記述を照合。確度: 高（事実関係は再現済み、重大度は解釈依存）。
- **U（** 具体的修正（truth value は不変）: (a) impl の Variable contract に「本モデルは ¶3 main の人数条件 trigger のみ。¶3 ただし書による各別提出（連署の任意化）は連署手続として対象外」の一文を追加、(b) 述語名を `meetsJointDeclarationHeirThreshold` 等へ改名、または Tests コメントに当該留保を明記。採用方針は人間の法的レビューに委ねる。

#### U-2（norm id のデータ側未登録 — 非ブロッキング・統合級）

- **H（** `NORM|27ba36ac…` がエビデンス・レジスタに登録されていれば、レビュー完了後に `adversarial_review` 軸が立つはず、という仮説を検証する。
- **T（** repo 全走査の実出力: `data` = 0 命中、`docs` = 1 命中（`UNIT_JOINT_…md`）、`JapanTaxLaw` = 2 命中（impl/spec ヘッダ）。`checks_by_module()` 自体は pin を読み込んでいる（CHECK 4）。
- **D（** **判定: 未登録（新規 uncommitted ユニットの後工程と思料）**。転記・意味論の欠陥ではない。
- **C（** repo 走査と `checks_by_module()` 出力を照合。確度: 高。
- **U（** 具体的修正: `data/TRANSCRIPTION_CHECK_REGISTRY.json` と `data/verification_evidence.json` に norm id を登録し、ジェネレータ再実行で本モジュールのエビデンス行を確認する。

#### U-3（ヘッダ source path 表記の混在 — 非ブロッキング・-doc 級）

- **H（** ヘッダの `LawBody[2]/MainProvision/MainProvision[9]/Article:13/Article#13/Paragraph#3/…` が独立 walk の 0-based 経路と一致するかを検証する。
- **T（** CHECK 3 の実出力: 实际は `children[2]=MainProvision`、`children[9]=Article(Num=13)`、`Article children[4]=Paragraph(Num=3)`、`Paragraph children[1]=ParagraphSentence`、`children[0]=Sentence(main,Num=1)`。
- **D（** **判定: 表記のみの曖昧さ**。記事・段落・main/附則の実体は一致しており、誤出所ではない。
- **C（** 祖先チェーンとヘッダを照合。確度: 高。
- **U（** 具体的修正: `MainProvision/Article[Num=13]/Paragraph[Num=3]/Sentence[Num=1,main]` のように tag+attr 基準へ統一表記する。

---

### Verdict

**具体的なブロッキング欠陥は検出されなかった（NO CONCRETE DEFECT）。** raw 135052 bytes / SHA-256 `a11df504…76499d` の一致、needle の本 law 内全局一意（1 件）、法身份（石油石炭税法施行令 / 第十三条 / 第三項 / MAIN / CurrentEnforced / law_id 353CO0000000132）、漢字「二人」= 2、spec の独立性と全 Nat 普遍一致定理、example 12 件と境界 6 カテゴリ、実行コードの禁止トークン 0 — すべて独立再抽出で PASS。`以上 vs 未満`、2 での off-by-one、誤ラベル、循環 spec は反証済み。U-1（¶3 ただし書のスコープ）、U-2（norm id 未登録）、U-3（path 表記）は非ブロッキングの留保であり、いずれもtruth value を変えない具体的修正を記載した。

**本レビューは法的正確性を主張するものではない。人間の法的レビューは未完了（LEGAL_REVIEW_PENDING）。** とりわけ U-1 のただし書の法的取扱い、および `lake build` によるカーネル再検証は人間の判断・実行に委ねる。
