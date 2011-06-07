shared_examples_for "TroleGroup Write API" do

  describe '#clear_rolegroups!' do
    it "should clear rolegroups and invalidate rolegroups cache" do
      user.set_rolegroups :admin
      user.clear_rolegroups!
      expect { user.rolegroup_list }.to change{user.rolegroup_list_value }
      user.rolegroup_list.should be_empty      
    end

    it "successive clear rolegroups should not invalidate rolegroups cache" do
      user.set_rolegroups :admin
      user.clear_rolegroups!
      expect { user.rolegroup_list }.to change{user.rolegroup_list_value }
      user.clear_rolegroups!      
      expect { user.rolegroup_list }.to_not change{user.rolegroup_list_value }
    end
  end
end