# Independent adversarial review — UsForcesTreatyEnforcementDateReiwa8

Produced by a second, independent re-extraction path (fresh Python JSON walk and hash recomputation), because delegated adversarial subagents are unavailable (usage limit).

### UsForcesTreatyEnforcementDateReiwa8.lean — 米軍地位協定国税臨時特例法 附則第一条（令和八年四月一日施行）

独立再抽出により原文・施行版・ハッシュをヘッダーではなくスナップショットから再計算し、実装・仕様・証明を照合した。H/T/D/C/U の各軸で判定する。

- **H（反証可能仮説）**: 本法律は令和八年四月一日から施行される。これが誤りなら、needle の位置・年月日・法令のいずれかが一致しない。
- **T（再現検査）**: 生データ `327AC0000000113_20260401_508AC0000000012.law.json`（21,641 bytes）の SHA-256 を再計算し `bb30245b…8434a` を得た（ヘッダー一致）。独立 JSON walk で needle は substring 1 回・exact leaf 1 回（パス `law_full_text/children[1]/children[10]/children[1]/children[2]/children[1]/children[0]/children[0]`）。`children[10]` は SupplProvision であり、本則ではなく附則層に位置する。Title は長い正式名で INVENTORY と一致、`CurrentEnforced`。
- **D（合否）**: PASS。`int_to_kanji(8)=八`、`int_to_kanji(4)=四`、`int_to_kanji(1)=一` を確認し、`spec_literals = {8, 4}` が原文で検証された（一は構造数字として除外）。日付三つ組 (8,4,1) を包括し、年・月・日のいずれかが異なる場合は closed example で棄却する。
- **C（対立解釈）**: 異なる年・月・日を許容する読みは `wrong_year_false` 等により棄却。実装名を仕様が再利用する循環はなく `independent_spec_ok = True`。仕様は後継者シフトによる別定式を用い、普遍定理を definitionally equal としてカーネル検証した。
- **U（不確かさ）**: 原文転写の忠実性のみ。西暦換算、他の附則条項、施行に関する一般規則は未モデル化のまま保留（`LEGAL_REVIEW_PENDING`）。

追加確認: `example` 宣言 8 件、境界カテゴリ 5 種、禁止トークン 0 件、`#print axioms` により定理が公理非依存。

**判決**: 具体的な欠陥は検出されなかった。法的正确性の主張ではない。人間の法的レビューは保留とする。
