require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe SentencesController do

  # This should return the minimal set of attributes required to create a valid
  # Sentence. As you add validations to Sentence, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  describe "GET index" do
    it "assigns all sentences as @sentences" do
      sentence = Sentence.create! valid_attributes
      get :index
      assigns(:sentences).should eq([sentence])
    end
  end

  describe "GET show" do
    it "assigns the requested sentence as @sentence" do
      sentence = Sentence.create! valid_attributes
      get :show, :id => sentence.id.to_s
      assigns(:sentence).should eq(sentence)
    end
  end

  describe "GET new" do
    it "assigns a new sentence as @sentence" do
      get :new
      assigns(:sentence).should be_a_new(Sentence)
    end
  end

  describe "GET edit" do
    it "assigns the requested sentence as @sentence" do
      sentence = Sentence.create! valid_attributes
      get :edit, :id => sentence.id.to_s
      assigns(:sentence).should eq(sentence)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Sentence" do
        expect {
          post :create, :sentence => valid_attributes
        }.to change(Sentence, :count).by(1)
      end

      it "assigns a newly created sentence as @sentence" do
        post :create, :sentence => valid_attributes
        assigns(:sentence).should be_a(Sentence)
        assigns(:sentence).should be_persisted
      end

      it "redirects to the created sentence" do
        post :create, :sentence => valid_attributes
        response.should redirect_to(Sentence.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved sentence as @sentence" do
        # Trigger the behavior that occurs when invalid params are submitted
        Sentence.any_instance.stub(:save).and_return(false)
        post :create, :sentence => {}
        assigns(:sentence).should be_a_new(Sentence)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Sentence.any_instance.stub(:save).and_return(false)
        post :create, :sentence => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested sentence" do
        sentence = Sentence.create! valid_attributes
        # Assuming there are no other sentences in the database, this
        # specifies that the Sentence created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Sentence.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => sentence.id, :sentence => {'these' => 'params'}
      end

      it "assigns the requested sentence as @sentence" do
        sentence = Sentence.create! valid_attributes
        put :update, :id => sentence.id, :sentence => valid_attributes
        assigns(:sentence).should eq(sentence)
      end

      it "redirects to the sentence" do
        sentence = Sentence.create! valid_attributes
        put :update, :id => sentence.id, :sentence => valid_attributes
        response.should redirect_to(sentence)
      end
    end

    describe "with invalid params" do
      it "assigns the sentence as @sentence" do
        sentence = Sentence.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Sentence.any_instance.stub(:save).and_return(false)
        put :update, :id => sentence.id.to_s, :sentence => {}
        assigns(:sentence).should eq(sentence)
      end

      it "re-renders the 'edit' template" do
        sentence = Sentence.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Sentence.any_instance.stub(:save).and_return(false)
        put :update, :id => sentence.id.to_s, :sentence => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested sentence" do
      sentence = Sentence.create! valid_attributes
      expect {
        delete :destroy, :id => sentence.id.to_s
      }.to change(Sentence, :count).by(-1)
    end

    it "redirects to the sentences list" do
      sentence = Sentence.create! valid_attributes
      delete :destroy, :id => sentence.id.to_s
      response.should redirect_to(sentences_url)
    end
  end

end