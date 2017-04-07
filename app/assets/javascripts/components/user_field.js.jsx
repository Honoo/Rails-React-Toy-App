// Used an editable text field in user profiles.

var UserField = React.createClass({
  getInitialState: function() {
    return {
      item: this.props.item,
      showTextbox: false
    };
  },

  handleClick: function(){
    this.setState({ showTextbox: true });
  },

  changeValue: function(newValue){
    console.log(newValue);
    var user = {};
    user[this.props.field] = newValue;

    $.ajax({
      url: window.location.href,
      method: "PUT",
      data: { 
        id: this.props.user_id, 
        user: user
      }
    });
    this.setState({ item: newValue, showTextbox: false });
  },

  render: function() {
    return (
      <div>
        <span onClick={this.handleClick}>{this.state.item}</span>
        { this.state.showTextbox ? <Textbox field={this.props.field} 
                                            handleChange={this.changeValue.bind(this)}
                                    /> : null 
        }
      </div>
    );
  }      
});

var Textbox = React.createClass({
  propTypes: {
    handleChange: React.PropTypes.func,
  },

  handleClick: function(){
    var newValue = $("#" + this.props.field + "_textbox").val();
    this.props.handleChange(newValue);
  },

  render: function() {
    return (
      <div>
        <input id={this.props.field + "_textbox"} type="text" />
        <button onClick={this.handleClick}>Change Value</button>
      </div>
    );
  }
});