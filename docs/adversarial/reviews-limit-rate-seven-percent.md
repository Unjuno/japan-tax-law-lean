### LimitRateSevenPercent.lean — 租税条約等実施特例法施行令 art.4(1)(4)（百分の七）

- 独立再抽出: impl / spec / tests の doc-comment、`UNIT_LIMIT_RATE_SEVEN_PERCENT.md`、`transcription_audit.py` のヘッダを一切信用せず、worktree 外 `D:\CodexData\Temp\opencode\_review_tmp\*.py` の使い捨て Python が pinned 生 JSON を直接読み、自前 walker で全ツリー走査・SHA 再計算・漢字パース・NORM 再計算を実施。一時スクリプトはレビュー後に削除。
- 一次資料: `data/raw/362CO0000000335_20260521_506CO0000000150.law.json`（law 362CO0000000335, revision 362CO0000000335_20260521_506CO0000000150, CabinetOrder）。
- 対象 needle: 「限度税率が百分の七である場合」／主張 NORM|dfc45330a683e8b1b033e5b78eaf211d568a0c15cdf9ae0da6cdd3554c54c4fe。

H/T/D/C/U（独立レビュー記録）:

#### 1. 生スナップショット SHA-256（CRLF→LF 正規化）

- H（反証可能仮説）: impl ヘッダの sha256 `8b21ff78cd78a30af9f90521756b31c40e33d0fd919481bb90822de542421e18` は pinned 生 JSON の真のダイジェストである。
- T（再生・実出力）: `python D:\CodexData\Temp\opencode\_review_tmp\analyze.py` → `raw bytes (as stored): 513843`, `has CRLF: 0  bare CR: 0`, `bytes after CRLF->LF: 513843`, `sha256(CRLF->LF): 8b21ff78cd78a30af9f90521756b31c40e33d0fd919481bb90822de542421e18`, `MATCH: True`。`data/INVENTORY.json:5908-5909` の `source_sha256: 8B21FF78CD78A30AF9F90521756B31C40E33D0FD919481BB90822DE542421E18`, `size_bytes: 513843` と一致。
- D（判定）: **PASS**。具体的値: 513843 bytes, SHA-256 = `8b21ff78cd78a30af9f90521756b31c40e33d0fd919481bb90822de542421e18`（impl ヘッダ・INVENTORY 大写版のいずれとも完全一致）。
- C（競合説明）: 「CRLF 正規化で値が変わる／ヘッダは古いハッシュでは」という競合を検査。当該ファイルは CRLF 0 本のため raw bytes と正規化後は同一（513843 bytes）、差違なし。棄却。
- U（不確実性）: ハッシュはバイト同一性のみを保証し、法的意味・条項定位を保証しない（後続 check で別途検証）。欠陥なし。

#### 2. 逐語 needle の一意性・法 identity・revision status

- H（反証可能仮説）: needle は全法で 1 回のみ出现し、`revision_info.law_title` は INVENTORY と一致し、`current_revision_status = CurrentEnforced` である。
- T（再生・実出力）: `analyze.py` → `needle hit count (whole law tree): 1`, `raw textual occurrences in file: 1`, `law_id: 362CO0000000335`, `law_title: 租税条約等の実施に伴う所得税法、法人税法及び地方税法の特例等に関する法律施行令`, `current_revision_status: CurrentEnforced`。`INVENTORY.json:5878-5912` の `official_title`/`current_revision.law_title`/`current_revision_status`/`selection_status: current_enforced`/`current_revision.law_revision_id` がいずれも一致。`norm2.py` でも全 Article:4（MAIN 1 + 附則 2）を走査し `total matching units: 1`。
- D（判定）: **PASS**。具体的値: whole-law needle count = **1**（verbatim-unique）、title 完全一致、status = `CurrentEnforced`（raw と INVENTORY の両方）、revision id 完全一致。
- C（競合説明）: `revision_info.remain_in_force = False` を「現行ではない」という競合読みとして検査。`probe2.py` の全スナップショット分布 `('CurrentEnforced', False) -> 355`, `('PreviousEnforced', False) -> 1` により、全 CurrentEnforced で False はデータ-set の定数であり、権威ある `current_revision_status = CurrentEnforced` および INVENTORY `selection_status = current_enforced` と矛盾しない。棄却。また raw の `updated = 2026-04-21T10:46:29+09:00` と INVENTORY `updated = 2026-05-21T01:47:19+09:00` の 1 か月差はメタデータのみで、module は `updated` を主張していない（非決定的な付随事実として U に回す）。
- U（不確実性）: 上記 `updated` の不整合は非決定的・非ブロッキング。逐語照合は転写忠実性のみを担保し、法的正当性を担保しない。

#### 3. 源位置（第四条 / 第一項 / 第四号 / MAIN、附則でない）

- H（反証可能仮説）: needle は `attr.Num = 4` の Article 第四条・Paragraph#1・Item#4 の MAIN provision にあり、附則（SupplProvision）にはない。
- T（再生・実出力）: `norm2.py` → `outer_path: ('LawBody[2]', 'MainProvision', 'MainProvision[8]', 'Article:4')`, `MATCH UNIT text: 限度税率が百分の七である場合`, `kind: CONDITION provision: MAIN article: 4 paragraph: 1 item: 4`, `source_path: LawBody[2]/MainProvision/MainProvision[8]/Article:4/Article#4/Paragraph#1/Item#4/ItemSentence/Column#1/Sentence#1`。附則 Article:4 は 2 件（`SupplProvision[4]` ×2）あるが一致 unit なし。`computed id: NORM|dfc45330...54c4fe`, `EQUAL: True`。
- D（判定）: **PASS**。具体的値: `provision = MAIN`, `article = 4`, `paragraph = 1`, `item = 4`, `kind = CONDITION`。附則での一致数 = 0、MAIN での一致数 = 1。源パスは impl ヘッダ記載と完全一致。NORM id も `normative_core.decompose_article`（`task_queue.iter_articles` の path 規約どおり）で再計算し主張値と一致。
- C（競合説明）: 「同じ『第四条』が附則にもあるため誤定位では」という競合を検査。附則 2 件を明示走査したが needle 不匹配（各 3 units、該当なし）。誤定位を棄却。
- U（不確実性）: NORM 再計算は `law_id / revision / anum / enforcement_date / outer_path` をピン留め資料から再構成したもの（全て pinned 値）。再計算が一致したため id の改竄・誤ラベルは否定される。附則自体の法的判断は範囲外。

#### 4. 率セマンティクス（百分の七 = 7/100、7/1000 でない）

- H（反証可能仮説）: 原文の率は 7/100 であり、10 倍誤り 7/1000 や 70/100 ではない。spec の交差掛け `p*100 == 7*100` は `p == 7` と同値である。
- T（再生・実出力）: `python D:\CodexData\Temp\opencode\_review_tmp\rate.py`（`generate_verification_evidence.py` の `parse_statutory_rate` / `source_literals_verified` を import）→ `parse_statutory_rate(clause) = 7/100`, `== 7/100 ? True`, `== 7/1000 ? False`, `source_literals_verified({7,100}, clause) = True`, `({7,1000}) = False`, `({70,100}) = False`, `({7,10000}) = False`, `kanji 七 count: 1  百 count: 1`。交差掛け同値の総当たり `0..100000`: `counterexamples: [] count: 0`（`100 > 0` により Nat 上掛け算は単射）。
- D（判定）: **PASS**。具体的値: `Fraction(7,100)`。正しいリテラル集合 {7,100} のみ受理、誤り集合 {7,1000}/{70,100}/{7,10000} はすべて拒否。七・百が各 1 回出现。off-by-one 反例 0 件。
- C（競合説明）: 「百分の七を 7/1000 と読む 10 倍誤り」「7 の境界を 6 または 8 に含む off-by-one」を競合として検査。いずれもパーサ・リテラル検証・総当たりで棄却。
- U（不確実性）: 定義域は Nat（整数パーセント・ポイント）であり、小数率（例 7.5%）は表現不可。本条項「限度税率が百分の七である場合」は Case 判定条件であり、上限（≤7%）としての適用や課税標準への乗算は明示的に NOT MODELLED。法的意味の確定は人間のレビューに委ねる。

#### 5. Lean 三層の構造（循環性・普遍性・境界・禁止トークン）

- H（反証可能仮説）: spec の `spec*` defs は impl 名を再利用せず、`agree_rate` は全 Nat に対するカーネル検証済み普遍定理であり、`example` ≥ 5、境界カテゴリ ≥ 3、実行コードに `sorry`/`admit`/`axiom`/`Classical.choice` はない。
- T（再生・実出力）: 三ファイルを直接読了。`grep -n` で禁止トークンは `LimitRateSevenPercent.lean:31` のコメント行のみ（実行コード 0 件）。`example` は spec 2 件（:50,:57）+ tests 12 件（:14〜:42）= **14 件**。`agree_rate (percent : Nat)` は `by_cases h : percent = 7` / `subst` / `decide` / `have hm : ¬ percent * 100 = 7 * 100 := by omega` / `simp [h, hm]` で構成。`spec*` defs（`specRateNumerator`, `specRateDenominator`, `specIsSevenPercent`, `specRateGrid`）は impl 識別子（`statutoryRatePercent`, `isSevenPercent`）を一切参照せず、橋渡しは `agree_rate` 定理のみ。Tests :38 に `example (x : Nat) : isSevenPercent x = specIsSevenPercent x := agree_rate x`（任意 Nat への適用）。
- D（判定）: **PASS**。具体的値: `example` 14 件、普遍定理 1 件、境界カテゴリ 3 種類 `{below: 0,1,6 / at: 7 / above: 8}`（加えて grid に 100, 定理は全 Nat）、禁止トークン実行コード 0 件、spec 内の impl 名参照 0 件。
- C（競合説明）: 「spec が impl を呼ぶ循環定義では」「サンプル検査にすぎないのでは」を競合として検査。前者は spec def 内の impl 名 grep 0 件で棄却。後者は `agree_rate` が `forall percent` の定理であり `omega` + `simp` でカーネル閉じしていること、Tests :38 が任意 `x` に適用していることで棄却。`specRateGrid` は有限だがコメントどおり scaffolding のみで証明の根拠ではない（独立オラクルではない点は U に記録）。
- U（不確実性）: 本環境には `lean` / `lake` バイナリが PATH に存在せず（`lean-toolchain` は `leanprover/lean4:v4.35.0` を宣言）、実カーネル・コンパイルは未実施。証明妥当性は静的読了（`percent*100` は線形で `omega` 可能、`simp [h]` が Nat.beq を還元）に基づく。`specRateGrid` は `decide (percent == 7)` を期待値に用いるため独立オラクルではないが、独立性は `agree_rate` と spec 定数側に存する。これらは欠陥ではないが、実ビルド検証は未完了として明記する。

#### 6. 横断整合性（audit pin / import / doc）

- H（反証可能仮説）: 新 pin が有効で、3 import が追加され、法・条項・revision・sha の誤ラベルがない。
- T（再生・実出力）: `python scripts/ci/transcription_audit.py` → `PASS  租税条約等実施特例法施行令 art.4(1)(4)（限度税率百分の七）↔ LimitRateSevenPercent.lean (rate 7/100)` および `transcription audit: 453/453 checks passed`。`grep` で `scripts/ci/transcription_audit.py:3471-3475` に pin（law `362CO0000000335`, article `第四条`, needle「限度税率が百分の七である場合」）、`JapanTaxLaw.lean:1786-1788` に 3 import を確認。同一 namespace の重複定義なし（grep で 3 ファイルのみ）。
- D（判定）: **PASS**。具体的値: `453/453` checks passed、新 pin の law id / article / needle 一致、import 3 件、名前衝突 0 件。
- C（競合説明）: 「法・条項・revision・sha の誤ラベル」を競合として検査。Check 1〜4 の実測（sha 一致、title/status 一致、MAIN art.4(1)(4) 定位、率 7/100）によりすべて棄却。
- U（不確実性）: 当該 audit は自己免責どおり「transcription fidelity only — NOT a semantics audit, NOT legal correctness」。したがって gate 通過は法的正当性の証明ではない。

### 判定（verdict）

**具体欠陥は検出されず（NO CONCRETE DEFECT FOUND）。** 6 項目すべて PASS: (1) SHA-256 `8b21ff78…e18` / 513843 bytes 一致、(2) needle 全法 1 回・title/status/revision 一致、(3) MAIN 第四条(1)(4) に定位し附則一致 0・NORM id 再計算一致、(4) 率 = `7/100`（7/1000 を拒否、境界反例 0）、(5) spec 独立・普遍定理・14 examples・3 境界カテゴリ・禁止トークン 0、(6) audit 453/453・pin/import 整合。

非決定的な付随観察（いずれもブロッキングではない）: raw と INVENTORY の `updated` タイムスタンプ差（2026-04-21 vs 2026-05-21）、本環境に Lean コンパイラ不在のため実カーネル実行は未実施、`specRateGrid` は独立オラクルではない（証明は `agree_rate` に依存）。これらは rate/identity/location の主張を傷つけない。

**本レビューは機械的・経験的検証の記録であり、法的正当性を一切主張しない（NO LEGAL CORRECTNESS CLAIM）。** 「限度税率」の法的効果・課税標準・gated measure・他率ケース・附則の法的判断は NOT MODELLED であり、人間の法解釈レビューは未完了（LEGAL_REVIEW_PENDING）。
