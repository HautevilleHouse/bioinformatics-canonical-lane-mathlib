import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BioinformaticsCanonicalLaneLean

structure PhylogeneticTreePackage where
  taxa : List String
  distanceMatrix : List (List Float)
  reconstructionMethod : String
  tree : Option (Tree (String, Float))  -- using a hypothetical Tree type

def Tree (α : Type) : Type := List (α × Tree α)

structure PhylogeneticEvidence (P : PhylogeneticTreePackage) where
  taxaNonEmpty : P.taxa.length ≥ 2
  distanceSymmetric : ∀ i j, P.distanceMatrix[i][j] = P.distanceMatrix[j][i]
  treeDefined : P.tree ≠ none

structure PhylogeneticTreeClosure (P : PhylogeneticTreePackage) : Prop :=
  taxaNonEmpty : P.taxa.length ≥ 2
  distanceSymmetric : ∀ i j, i < P.distanceMatrix.length → j < P.distanceMatrix.length → P.distanceMatrix[i][j] = P.distanceMatrix[j][i]
  treeDefined : P.tree ≠ none

theorem phylogenetic_tree_closed_from_evidence (P : PhylogeneticTreePackage) (E : PhylogeneticEvidence P) : PhylogeneticTreeClosure P :=
by
  exact ⟨E.taxaNonEmpty, E.distanceSymmetric, E.treeDefined⟩

end BioinformaticsCanonicalLaneLean
end HautevilleHouse