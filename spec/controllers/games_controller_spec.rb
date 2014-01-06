require 'spec_helper'

describe GamesController do
  shared_examples("public access to site") do
    describe "GET 'index'" do
      it "populates an array of games" do
        game1 = create( :game )
        game2 = create( :game )
        get :index
        expect(assigns( :games )).to match_array( [game1, game2] )
      end

      it "renders the :index view" do
        get :index
        expect( response ).to render_template :index
      end
    end

    describe 'GET #show' do
      it "assigns the requested contact to @game" do
        game = create( :game )
        get :show, id: game
        expect(assigns( :game )).to eq game
      end


      it "renders the :show template" do
        game = create( :game )
        get :show, id: game
        expect( response ).to render_template :show
      end
    end
  end

  describe "public access" do
    it_behaves_like "public access to site"

    describe 'GET #new' do
      it "redirects to login page" do
        get :new
        response.should redirect_to( new_user_session_path )
      end
    end

    describe "POST #create" do
      it "redirects to login page" do
        post :create, id: create(:game),
        game: attributes_for(:game)
        response.should redirect_to( new_user_session_path )
      end
    end

    describe 'DELETE #destroy' do
      it "redirects to login page" do
        delete :destroy, id: create( :game )
        response.should redirect_to( new_user_session_path )
      end
    end
  end

  describe "member access" do
    it_behaves_like "public access to site"

    let(:valid_attributes) { attributes_for(:game) }
    login_user

    describe "GET new" do
      it "assigns a new game as @game" do
        get :new, {}
        assigns( :game ).should be_a_new( Game )
      end
    end

    describe "POST create" do
      describe "with valid params" do
        it "creates a new Game" do
          expect {
            post :create, {game: valid_attributes}
          }.to change( Game, :count ).by( 1 )
        end

        it "assigns a newly created game as @game" do
          post :create, {:game => valid_attributes}
          assigns( :game ).should be_a( Game )
          assigns( :game ).should be_persisted
        end

        it "redirects to the created game" do
          post :create, {game: valid_attributes}
          response.should redirect_to(Game.last)
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved game as @game" do
          # Trigger the behavior that occurs when invalid params are submitted
          Game.any_instance.stub( :save ).and_return( false )
          post :create, {game: { "name" => "invalid value" }}
          assigns( :game ).should be_a_new( Game )
        end

        it "re-renders the 'new' template" do
          # Trigger the behavior that occurs when invalid params are submitted
          Game.any_instance.stub( :save ).and_return( false )
          post :create, {game: { "name" => "invalid value" }}
          response.should render_template( "new" )
        end
      end
    end

    describe "DELETE destroy" do
      it "destroys the requested game" do
        game = create( :game )
        expect {
          delete :destroy, {id: game.to_param}
        }.to change(Game, :count).by(-1)
      end

      it "redirects to the games list" do
        game = create( :game )
        delete :destroy, {id: game.to_param}
        response.should redirect_to( games_url )
      end
    end
  end
end
