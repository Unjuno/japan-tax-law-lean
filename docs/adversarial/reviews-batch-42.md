# Adversarial review — batch 42

### QuorumOneThird.lean — 関税等不服審査会令 第七条

- 独立再抽出: doc-comment / impl・spec・tests を一切信用せず、worktree 外 `D:\CodexData\Temp` の使い捨て Python が pinned 生 JSON を直接読み、自前 walker で `tag=Article` & `attr.Num="7"` を定位・正規化。実行後に一時スクリプトは削除済み。
- 一次資料: `data/raw/412CO0000000277_20160401_428CO0000000168.law.json`（law 412CO0000000277, revision 412CO0000000277_20160401_428CO0000000168, 関税等不服審査会令）。
- SHA-256 再計算: `c473d24ee2e16ec16f15f5ff52b870890a6ae70648672b3a47c0c26f75cc7709`（生バイト 16889 バイト）→ CONFIRMED。
- Article 定位: `Num="7"` を構造走査で 1 件検出、needle はその Article ノード内に verbatim 1 回（原文全体でも 1 回）→ CONFIRMED。
- 逐語照合: needle「審査会は、委員の三分の一以上が出席しなければ、会議を開き、議決することができない。」は原文に verbatim 1 回存在（判定: FOUND）→ CONFIRMED。
- 数詞再計算: 三分の一 = 1/3 = 三分之一。「以上」は INCLUSIVE >=。present/total >= 1/3 ⇔ 3*present >= total（total=0 はゼロ除算ガードで false）。impl の係数 3 と spec の独立定数 specThirdDen=3 が一致 → CONFIRMED。
- 境界照合 (≥3): (0,0) → false（ゼロ除算）; (1,3) → true（ちょうど 1/3）; (0,3) → false; (1,2) → true（3>=2）; (1,4) → false（3*1=3<4、つまり 1/4 < 1/3）; (2,4) → true; (2,7) → false（3*2=6<7）; (3,7) → true。impl↔spec 一致も全点で確認、矛盾 0 → CONFIRMED。
- 敵対的指摘: 依頼文中の「(1,4) true (>1/3)」は固定された交叉乗算 3*present>=total と矛盾（3<4）。式を改変せず false を採用し、tests にその算術を明記。total=4 で定足数を満たす最小 present は 2 → BY-DESIGN。
- 検出器: `independent_spec_ok` True（独立定数 specThirdDen=3、impl 識別子なし。普遍定理 agreeQuorum は unfold + rfl の純粋書き換えで axiom-free、by_cases/omega/Classical.choice 不使用）、`boundary_evidence_categories` = {zero, small_input, saturation}、`spec_literals` = {3}、`source_literals_verified(spec_literals, scoped)` True（三分の一 = 3 を原文として verbatim 認識）→ CONFIRMED。

判定: BY-DESIGN / CONFIRMED（原文の明示的な定足数「委員の三分の一以上が出席」= 総数の 1/3 以上（以上は包含）のみをモデル化。開議・議決手続、委員の構成、他の条項は範囲外）。全 H で通過。

H/T/D/C/U（独立レビュー記録）:
- H（原条項）: 第七条の「委員の三分の一以上が出席しなければ、会議を開き、議決することができない」という明示的な定足数のみ。
- T（逐語性）: 自前再抽出の needle が原文に verbatim 1 回存在。SHA-256 は生バイトから再計算。
- D（導出）: 三分の一 → 1/3 → 3*present >= total（total>0）。impl は decide 係数 3、spec は独立定数 specThirdDen=3。橋渡しは普遍定理かつ unfold + rfl のみで追加公理を導入しない。
- C（整合）: zero / 1/3,1/2,1/4,2/7 境界 / 交叉乗算恒等式 / impl↔spec 一致を全て `by decide` または普遍定理で確認。
- U（範囲外）: 開議・議決の手続、委員の構成・任期、他の条項、実数・負の値（Nat 前提）、(1,4) に関する誤った期待値は NOT MODELLED。

注記: 本記録は機械的検証（worktree 外での再抽出・再計算・検出器実行）の結果であり、人間の法解釈レビューではない（LEGAL_REVIEW_PENDING; mechanical, not human review）。
