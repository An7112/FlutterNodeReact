import React, {Component} from 'react';
import axios from 'axios';

export default class Create extends Component {
    constructor(props) {
        super(props);
        this.onChangesender = this.onChangesender.bind(this);
        this.onChangetitle = this.onChangetitle.bind(this);
        this.onChangemesseage = this.onChangemesseage.bind(this);
        this.onChangesend_to = this.onChangesend_to.bind(this);
        this.onSubmit = this.onSubmit.bind(this);

        this.state = {
            sender: '',
            title: '',
            messeage:'',
            send_to:''
        }
    }

    onChangesender(e) {
        this.setState({
            sender: e.target.value
        });
    }

    onChangetitle(e) {
        this.setState({
            title: e.target.value
        });
    }

    onChangemesseage(e) {
        this.setState({
            messeage: e.target.value
        });
    }
    onChangesend_to(e) {
        this.setState({
            send_to: e.target.value
        });
    }

    onSubmit(e) {
        e.preventDefault();

        const obj = {
            sender: this.state.sender,
            title: this.state.title,
            messeage: this.state.messeage,
            send_to: this.state.send_to
        };
        axios.post('http://localhost:60444/notifications/add', obj)
            .then(res => console.log(res.data));

        this.setState({
            sender: '',
            title: '',
            messeage: '',
            send_to:''
        })
    }

    render() {
        return (
            <div style={{marginTop: 10}}>
                <h3>Add New</h3>
                <form onSubmit={this.onSubmit}>
                    <div className="form-group">
                        <label>sender: </label>
                        <input type="text" className="form-control"
                               value={this.state.sender}
                               onChange={this.onChangesender}
                        />
                    </div>
                    <div className="form-group">
                        <label>title: </label>
                        <input type="text" className="form-control" value={this.state.title}
                               onChange={this.onChangetitle}/>
                    </div>
                    <div className="form-group">
                        <label>messeage: </label>
                        <input type="text" className="form-control" value={this.state.messeage}
                               onChange={this.onChangemesseage}/>
                    </div>
                    <div className="form-group">
                        <label>Send to: </label>
                        <input type="text" className="form-control" value={this.state.send_to}
                               onChange={this.onChangesend_to}/>
                    </div>
                    <div className="form-group">
                        <input type="submit" value="Register" className="btn btn-primary"/>
                    </div>
                </form>
            </div>
        )
    }
}