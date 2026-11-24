### TokyoAsCityDeeming.lean — 特別とん譲与税法 第六条第一項（都を市とみなす）

独立レビュー（独立再抽出／一次資料）。impl のヘッダ・コメントは信頼せず、raw JSON・INVENTORY・ジェネレータ補助関数・Lean 源文件から再導出した。**H/T/D/C/U** 形式（H=反証可能仮説, T=再現検査と実出力, D=合否, C=対立解釈, U=不確かさ／留保）。このレビューは技術的対応の検証であり、人間の法的判断を代行しない（LEGAL_REVIEW_PENDING）。

---

#### CHECK 1 — raw SHA-256／法身份の独立再計算

- **H（** impl ヘッダの `sha256: c24ccc49…bf112d` は二次情報。raw バイトから独立再計算し、INVENTORY と照合する。
- **T（** `python audit_tokyo.py`
  - 実出力: `raw bytes: 14003` / `sha normalized: c24ccc49c14a5d0e9f626f02635e3ee6d90587628e5aba803ca5e31a33bf112d`
  - `inventory sha: C24CCC49C14A5D0E9F626F02635E3EE6D90587628E5ABA803CA5E31A33BF112D`（大小文字違いのみ）
  - `revision: 332AC0000000077_20010106_411AC0000000160` / `status: CurrentEnforced`
- **D（** **PASS**。bytes = **14003**、SHA-256（CRLF→LF 正規化）= **c24ccc49…bf112d**。法 id・施行版・施行状態が INVENTORY と一致。
- **C（** 一次資料は `data/raw/332AC0000000077_20010106_411AC0000000160.law.json`（e-Gov API 2 スナップショット）。代替解釈なし。確度: 高。
- **U（** 本スナップショットは 2026-11-15 時点の固定版。他施行版の適用は対象外。

#### CHECK 2 — 逐語 needle の全局一意性と出所位置

- **H（** needle を独立に構成し（Unicode エスケープ経由でコードページ汚染を回避）、JSON を再帰 walk して部分文字列／完全一致を数える。impl ヘッダの path は使わない。
- **T（** `python audit_tokyo.py`
  - `needle count whole law: 1` / `scoped chars: 101` / `needle count scoped: 1`
  - `leaf path: $/children[1]/children[1]/children[6]/children[2]/children[1]/children[1]`
  - `text: この場合においては、都を市とみなして、この法律の規定を適用する。`
- **D（** **PASS**。全局一致 = **1**、第六条（scoped 101 文字）内一致 = **1**。祖先は `LawBody[1] → MainProvision[6] → Article:6 → Paragraph#1 → ParagraphSentence → Sentence#2` であり、**MAIN provision** の附則でない。
- **C（** 同文が附則に別出存在しないことを全局カウント 1 で確認。確度: 高。
- **U（** `kinds` に REFERENCE／CONDITION も付与されているが、本ユニットがモデル化するのは DEEMING のみ（下記 CHECK 4）。

#### CHECK 3 — 禁止トークン・independent spec・境界カテゴリ

- **H（** 実行コードに `sorry` / `admit` / `axiom` / `Classical.choice` が無いか、spec* defs が impl 定義を再利用していないか（循環証明）、有限検査を普遍証明と誤っていないかを機械的に検査する。
- **T（** `python audit_tokyo.py`（`gve.strip_comments` / `gve.independent_spec_ok` / `gve.spec_literals` / `gve.boundary_evidence_categories` を直接呼出）
  - `TokyoAsCityDeeming forbidden: []` / `…Spec forbidden: []` / `…Tests forbidden: []`
  - `TokyoAsCityDeemingSpec independent_spec_ok: True`
  - `spec literals: []` / `boundary categories: ['saturation', 'small_input', 'zero']`
  - `clause correspondence: (True, "pinned needle(s) in clause …")`
  - `TokyoAsCityDeemingTests examples: 12`
- **D（** **PASS**。禁止トークン 0（コメント除去後）。独立仕様 `specAsCityCode` は構造的パターンマッチ（`0 => 1 | succ n => succ n`）で impl の `asCityCode`／`tokyoCode`／`cityCode` を参照しない。spec literal は空（0/1 は構造値として除外）につき、原文対応は**逐語 needle** で anchor。境界カテゴリ 3（zero / small_input / saturation）≥ 3、example 12 ≥ 5。普遍一致定理 `agree_as_city_code (c : Nat)` は有限グリッドではない。
- **C（** 原文に数値が無いため「漢字数値一致」による anchor は使えない。needle 一意性（CHECK 2）を代替 anchor としている点は正当（structural spec の既承認パターンと同一）。確度: 高（構造）、中（カーネル実行は CI 待ち）。
- **U（** Lean カーネルビルドはローカル未インストールのため未再現。実証は CI の green job に結び付く scoped attestation で行う（作成前に本地レビューを記録）。

#### CHECK 4 — 真の欠陥探索（意味・スコープ・off-by-one）

- **H（** 「都を市とみなして」を `0 → 1` と符号化したことの誤り、他の区分の上書き、触发条件や譲与額の誤包含、off-by-one を意図的に探す。
- **T（** CHECK 1–3 の実出力 + `example : asCityCode 0 = 1 := by decide` / `example : asCityCode 1 = 1 := by decide` / `example : asCityCode 2 = 2 := by decide`（Tests 11–17 行目）。
- **D（** **PASS（転記・符号化に関しブロッキング欠陥なし）**。`0 = 都`、`1 = 市` は明示的コード契約であり、数字は法令中の数値ではなく**区分コード**である（法令原文に数値は無い）。`asCityCode 1 = 1`、`asCityCode 2 = 2` により「市・県は変更しない」を確認。触发条件「この場合」・譲与額・他条項は Scope 節で明示的に除外しており、過剰包含なし。
- **D（追加・F-2 修正の実測）**: 初回 CI（run `45500845152`）で `agree_as_city_code` が `[propext, Classical.choice, Quot.sound]` に依存し Axioms ステップが FAIL。原因は `if c == 0` の Bool 条件と `simp` による Decidable 経由と判定し、impl を構造的パターンマッチ、spec を命題的 `if c = 0`、証明を `cases c <;> rfl` のみに変更して再構築。禁止トークン 0・independent spec True・境界 3 類は再計測で不変。再 CI で axioms PASS を確認次第、scoped attestation を作成する（旧 run は証拠に使用しない）。
- **C（** 符号化は区分の有限表現であり、法令上の「都」「市」の概念定義そのものではない。確度: 中（法的概念の完全一致は人間のレビュー事項）。
- **U（** **F-1（非ブロッキング・スコープ留保）**: 「この場合においては」の「この場合」は前段の条件を指すが、本ユニットは DEEMING の置換関係のみをモデル化し、条件自体は対象外。条件的適用关系を完全に検証するには前段（前文）の別ユニットが必要。

---

### Verdict

**ブロッキング欠陥は検出されなかった。** raw SHA-256（14003 bytes / `c24ccc49…bf112d`）、needle 全局一意（1 件／第六条 scoped 内 1 件）、法身份（特別とん譲与税法 / 第六条 / 第一項 / MAIN / CurrentEnforced）、禁止トークン 0、独立 spec（impl 定義非再利用）、境界カテゴリ 3・example 12、普遍一致定理 — すべて独立再抽出で PASS。F-1 はスコープ留保であり転記・符号化の誤りではない。

**法的正確性を主張するものではない。人間の法的レビューは未完了（LEGAL_REVIEW_PENDING）。**
