class Horse < ActiveRecord::Base
  has_one :thumb
  has_many :results

  PEDIGREE = {
    :links => [{:source => 0, :target => 1, :value => 2},{:source => 0, :target => 2, :value => 2},
    {:source => 1, :target => 3, :value => 1},{:source => 1, :target => 4, :value => 1},{:source => 3, :target => 7, :value => 1},
    {:source => 3, :target => 8, :value => 1},{:source => 4, :target => 9, :value => 1},{:source => 4, :target => 10, :value => 1},
    {:source => 2, :target => 5, :value => 1},{:source => 2, :target => 6, :value => 1},{:source => 5, :target => 11, :value => 1},
    {:source => 5, :target => 12, :value => 1},{:source => 6, :target => 13, :value => 1},{:source => 6, :target => 14, :value => 1}]
  }

  def self.build_pedigree id
    pedigree = PEDIGREE
    pedigree[:nodes] = []

    # root
    horse = Horse.find(id)
    pedigree[:nodes] << {:name => horse.name, :id => horse.id, :sire => horse.sire_id, :dam => horse.dam_id, :group => 1}
    # gen1
    pedigree[:nodes] = self.sire_dam pedigree[:nodes], 0, 2
    # gen2
    pedigree[:nodes] = self.sire_dam pedigree[:nodes], 1, 4
    pedigree[:nodes] = self.sire_dam pedigree[:nodes], 2, 6
    # gen3
    pedigree[:nodes] = self.sire_dam pedigree[:nodes], 3, 8
    pedigree[:nodes] = self.sire_dam pedigree[:nodes], 4, 10
    pedigree[:nodes] = self.sire_dam pedigree[:nodes], 5, 12
    pedigree[:nodes] = self.sire_dam pedigree[:nodes], 6, 14

    pedigree
  end

  def self.sire_dam nodes, root, count
    horse = Horse.find(nodes[root][:sire])
    nodes << {:name => horse.name, :id => horse.id, :sire => horse.sire_id, :dam => horse.dam_id, :group => count}
    horse = Horse.find(nodes[root][:dam])
    nodes << {:name => horse.name, :id => horse.id, :sire => horse.sire_id, :dam => horse.dam_id, :group => count+1}
  end
end
