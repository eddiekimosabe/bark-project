import React, { Component } from 'react';

class App extends Component {
	constructor(props){
		super(props);
		this.state = {
			dogs: []
		}
		this.grabDogs = this.grabDogs.bind(this);
	}

	componentDidMount(){
		this.grabDogs();
	}

	grabDogs(){
		fetch('/dogs.json', {method: 'GET'})
			.then(response => response.json())
			.then(body => this.setState({dogs: body.data.dogs}))
	}

  render () {
  	const {dogs} = this.state;

  	if(!dogs) return "Loading"

    return (
    	<div>
      <h1>Homepage</h1>
	      {dogs.map(dog => (

	      ))}
      </div>
    );
  }
}

export default App;